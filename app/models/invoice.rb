class Invoice < ActiveRecord::Base
  belongs_to :customer
  has_many :consultants, through: :invoice_items
  has_many :invoice_items
  accepts_nested_attributes_for :invoice_items, reject_if: :all_blank, allow_destroy: true

  attr_accessible :customer_id, :desc, :discount, :due_date, :invoice_date, :paid_date, :short_desc, :term, :invoice_items_attributes

  validates :customer_id, presence: true
  validates :short_desc, presence: true
  validates :discount, numericality: { greater_than_or_equal_to: 0,less_than_or_equal_to: 50 }, allow_nil: true
  validates :term, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 90 }, allow_nil: true
  def self.from_address
    CFG[:invoice_from]
  end

  def self.options
    all.collect {|c| ["#{c.id}: #{c.short_desc}", c.id]}
  end

  def invoice_customer
    unless invoice_items.empty?
      self.invoice_date=Date.today
      self.due_date=invoice_date + term_days
      # Call Email Customer
      save
    else
      false
    end
  end

  def status
    if paid_date
      'Paid'
    elsif due_date && (due_date < Date.today)
      'Overdue'
    elsif due_date && (due_date >= Date.today)
      'Pending'
    else
      'Open'
    end
  end

  def discount_amount
    calculated_discount_amount || 0
  end

  def total_hours
    invoice_items.inject(0) {|result,item| result+=item.hours}
  end

  def total_cost
    invoice_items.inject(0) {|result,item| result+=item.cost}
  end

  def final_cost
    total_cost - discount_amount
  end

  def term_days
    term || customer.default_term || 30
  end
  private
    def calculated_discount_amount
      total_cost * discount/100 if discount
    end

    def set_final_costs
      self.final_cost=final_cost
      save
    end

end
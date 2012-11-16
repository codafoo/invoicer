require 'bigdecimal'
class InvoiceItem < ActiveRecord::Base
  belongs_to :consultant
  # belongs_to :customer
  belongs_to :invoice
  attr_accessible :date, :desc, :item_type_id, :rate, :time, :consultant_id, :consultant
  #, :customer_id

  validates :consultant_id, presence: true
  validates :rate, numericality: { greater_than_or_equal_to: 0}

  def hours
    convert_time_to_hours.round(2)
  end

  def cost
    hours * rate
  end

  private
    def convert_time_to_hours
      time.seconds_since_midnight.to_d/BigDecimal.new(3600)
    end
end

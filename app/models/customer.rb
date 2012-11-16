class Customer < ActiveRecord::Base
  attr_accessible :default_discount, :default_term, :desc, :contact_email, :name, :contact_name

  validates :name, presence: true, uniqueness: true
  validates :default_term,
    numericality: { greater_than_or_equal_to: 1,
      less_than_or_equal_to: 90 },
    allow_nil: true
  validates :default_discount,
    numericality: { greater_than_or_equal_to: 0,
      less_than_or_equal_to: 50 },
    allow_nil: true

  def self.options
    all.collect {|c| [c.name, c.id]}
  end
end
class Consultant < ActiveRecord::Base
  attr_accessible :default_rate, :email, :name, :title

  validates :name, presence: true, uniqueness: true
  validates :default_rate,
    numericality: { greater_than_or_equal_to: 0},
    allow_nil: true

  def self.options
    all.collect {|c| [c.name, c.id]}
  end
end

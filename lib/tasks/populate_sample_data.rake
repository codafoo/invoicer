require 'faker'

namespace :db do
  desc "Populate DB with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    make_consultants
    make_customers
    make_invoices
  end
end

def make_consultants
  10.times do |n|
    name = Faker::Name.name
    rate = Random.rand(15..150)
    Consultant.create!(name: name, default_rate: rate)
  end
end

def make_customers
  5.times do |n|
    name = Faker::Company.name
    if n%2==1
      term = Random.rand(7..45)
    else
      term = nil
    end
    contact_name = Faker::Name.name
    Customer.create!(name: name, default_term: term, contact_name: contact_name)
  end
end

def make_invoices
  customers=Customer.find(:all)
  consultants=Consultant.find(:all)
  30.times do |n|
    desc=Faker::Lorem.sentence
    if n%2==1
      discount=Random.rand(0..15)
      term=Random.rand(7..45)
      invoice_date=Date.today - Random.rand(1..200)
    else
      discount=nil
      term=nil
      invoice_date=Date.today
    end
    customer=customers.sample(1)
    invoice=Invoice.create!(short_desc: desc, discount: discount, term: term, customer_id: customer[0].id)
    20.times do |m|
      task_desc=Faker::Lorem.sentence
      consultant=consultants.sample(1)
      a_time="#{Random.rand(1..8)}:#{Random.rand(0..59)}"
      rate=Random.rand(15..150)
      invoice.invoice_items.create!(consultant_id: consultant[0].id, time: a_time, rate: rate, desc: task_desc)
    end
    invoice.invoice_customer(invoice_date)
  end
end
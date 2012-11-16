class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :short_desc
      t.text :desc
      t.date :invoice_date
      t.date :paid_date
      t.date :due_date
      t.integer :discount, default: 0
      t.integer :term
      t.integer :customer_id

      t.timestamps
    end
  end
end

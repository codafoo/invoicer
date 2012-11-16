class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.string :desc
      t.date :date
      t.integer :item_type_id
      t.integer :consultant_id
      t.integer :customer_id
      t.integer :invoice_id
      t.decimal :rate, :precision => 8, :scale => 2
      t.time :time

      t.timestamps
    end
  end
end

class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :contact_name
      t.string :contact_email
      t.text :desc
      t.integer :default_discount
      t.integer :default_term

      t.timestamps
    end
  end
end

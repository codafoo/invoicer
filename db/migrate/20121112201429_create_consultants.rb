class CreateConsultants < ActiveRecord::Migration
  def change
    create_table :consultants do |t|
      t.string :name
      t.string :title
      t.string :email
      t.decimal :default_rate, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end

class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :area
      t.integer :year
      t.string :name
      t.decimal :quantity
      t.string :currency
      t.string :financing
      t.string :region
      t.string :grant
      t.string :source
      t.string :status
      t.text :observations

      t.timestamps null: false
    end
  end
end

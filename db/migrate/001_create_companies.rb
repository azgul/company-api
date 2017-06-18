class CreateCompanies < ActiveRecord::Migration[5.0]
  def self.up
    create_table :companies do |t|
      t.integer :cvr
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.string :phone
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :companies
  end
end

class AddCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :city
      t.string :state
      t.string :date_founded 

      t.timestamps
    end
  end
end

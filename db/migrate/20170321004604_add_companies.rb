class AddCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :location
      t.text :fun_fact

      t.timestamps
    end
  end
end

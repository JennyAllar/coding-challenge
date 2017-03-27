class CreateFounders < ActiveRecord::Migration
  def change
    create_table :founders do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.integer :company_id
    end
  end
end

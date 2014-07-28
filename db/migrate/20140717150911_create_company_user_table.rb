class CreateCompanyUserTable < ActiveRecord::Migration
  def change
    create_table :company_users do |t|
      t.integer :user_id
      t.integer :company_id
      t.string :company_user_type

      t.timestamps
    end
  end
end

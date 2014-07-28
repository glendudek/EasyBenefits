class CreateCompanyTable < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :full_name
      t.string :default_tz

      t.timestamps
    end
  end
end

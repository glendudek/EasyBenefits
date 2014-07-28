class CreateBenefitPlanTable < ActiveRecord::Migration
  def change
    create_table :benefit_plans do |t|
      t.integer :benefit_provider_id
      t.integer :benefit_type_id
      t.string :name
      t.integer :display_priority

      t.timestamps
    end
  end
end

class CreateBenefitPlanOptionTable < ActiveRecord::Migration
  def change
    create_table :benefit_plan_options do |t|
      t.integer :benefit_plan_id
      t.string :name

      t.timestamps
    end
  end
end

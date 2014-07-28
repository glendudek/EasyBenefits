class CreateCompanyBenefitPlanOptionTable < ActiveRecord::Migration
  def change
    create_table :company_benefit_plan_options do |t|
      t.integer :company_id
      t.integer :benefit_plan_option_id
      t.decimal :total_cost_per_period
      t.decimal :employee_cost_per_period

      t.timestamps
    end
  end
end

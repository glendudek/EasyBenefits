class UserCompanyBenefitPlanOption < ActiveRecord::Migration
  def change
    create_table :user_company_benefit_plan_options do |t|
      t.integer :user_id
      t.integer :company_benefit_plan_option_id

      t.timestamps
    end
  end
end

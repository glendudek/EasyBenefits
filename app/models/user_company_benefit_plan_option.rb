class UserCompanyBenefitPlanOption < ActiveRecord::Base
  belongs_to :user
  belongs_to :company_benefit_plan_option
  has_one :company, through: :company_benefit_plan_option
  has_one :benefit_plan_option, through: :company_benefit_plan_option
  has_one :benefit_plan, through: :company_benefit_plan_option
  has_one :benefit_provider, through: :company_benefit_plan_option
  has_one :benefit_type, through: :company_benefit_plan_option
end

class CompanyBenefitPlanOption < ActiveRecord::Base
  belongs_to :company
  belongs_to :benefit_plan_option
  has_one :benefit_plan, through: :benefit_plan_option
  has_one :benefit_provider, through: :benefit_plan_option
  has_one :benefit_type, through: :benefit_plan_option
end

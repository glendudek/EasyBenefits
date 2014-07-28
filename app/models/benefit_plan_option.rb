class BenefitPlanOption < ActiveRecord::Base
  belongs_to :benefit_plan
  has_one :benefit_provider, through: :benefit_plan
  has_one :benefit_type, through: :benefit_plan
  has_many :company_benefit_plan_options
  has_many :companies, through: :company_benefit_plan_options
end

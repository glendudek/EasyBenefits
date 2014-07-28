class BenefitPlan < ActiveRecord::Base
  belongs_to :benefit_provider
  belongs_to :benefit_type
  has_many :benefit_plan_options, dependent: :destroy
end

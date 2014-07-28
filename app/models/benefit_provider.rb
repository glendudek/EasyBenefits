class BenefitProvider < ActiveRecord::Base
  has_many :benefit_plans, dependent: :destroy
end

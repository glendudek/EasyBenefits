class CompanyBenefitPlanOption < ActiveRecord::Base
  belongs_to :company
  belongs_to :benefit_plan_option
  has_many :user_company_benefit_plan_options, dependent: :destroy
  has_one :benefit_plan, through: :benefit_plan_option
  has_one :benefit_provider, through: :benefit_plan_option
  has_one :benefit_type, through: :benefit_plan_option

  def self.filter_by_type(benefit_type)
    filter_by_type_name(benefit_type.name)
  end

  def self.filter_by_type_name(type_name)
    joins(:benefit_type).where(BenefitType.table_name => {:name => type_name})
  end

  def selection_name
    "#{self.benefit_provider.name} #{self.benefit_plan.name}: #{self.benefit_plan_option.name} ($#{self.employee_cost_per_period.to_i} per pay period)"
  end
end

class CompanyBenefitPlanOptionSerializer < ActiveModel::Serializer
  attributes :id, :benefit_type, :benefit_name, :total_cost_per_period, :employee_cost_per_period

  def benefit_type
    object.benefit_type.name
  end

  def benefit_name
    object.plan_name
  end
end

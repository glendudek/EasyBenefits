module UsersHelper
  def user_benefit_type_select_param(type_name)
    "#{type_name}_id".downcase
  end

  def user_benefit_select_options(company, benefit_type, user)
    options = company.company_benefit_plan_options.filter_by_type(benefit_type)
    selected_option = user.user_company_benefit_plan_options.filter_by_type(benefit_type).first
    options_from_collection_for_select(options, :id, :selection_name, selected_option.present? ? selected_option.company_benefit_plan_option.id : -1)
  end
end

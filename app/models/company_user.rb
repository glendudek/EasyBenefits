class CompanyUser < ActiveRecord::Base
  def self.admin_conditions
    return {company_user_type: CompanyUserType::Admin.to_db}
  end
  def self.employee_conditions
    return {company_user_type: CompanyUserType::Employee.to_db}
  end
  classy_enum_attr :company_user_type, default: :employee
  belongs_to :company
  belongs_to :user
end

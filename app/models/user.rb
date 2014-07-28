class User < ActiveRecord::Base
  devise :database_authenticatable, :timeoutable
  has_many :company_users, dependent: :destroy
  has_many :user_company_benefit_plan_options, dependent: :destroy
  has_many :company_users_admin, -> { where CompanyUser.admin_conditions }, class_name: CompanyUser.name
  has_many :company_users_employee, -> { where CompanyUser.employee_conditions }, class_name: CompanyUser.name
  has_many :admin_companies, through: :company_users_admin, source: :company
  has_many :employee_companies, through: :company_users_employee, source: :company
end

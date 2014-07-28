class Company < ActiveRecord::Base
  has_many :company_users, dependent: :destroy
  has_many :company_users_admin, -> { where CompanyUser.admin_conditions }, class_name: User.name
  has_many :company_users_employee, -> { where CompanyUser.employee_conditions }, class_name: User.name
  has_many :admin_users, through: :company_users_admin, source: :user
  has_many :employee_users, through: :company_users_employee, source: :user
  has_many :company_benefit_plan_options
  has_many :benefit_types, -> { uniq }, through: :company_benefit_plan_options
end

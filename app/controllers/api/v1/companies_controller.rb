class Api::V1::CompaniesController < ApiController
  include CompaniesControllerShared

  before_action :authorize_company
  before_action :authorize_admin, only: [:users]

  def authorize_company
    find_company
    raise MyException::Unauthorized, "you are not authorized as an admin for company #{@company.id}" unless current_user.employee_companies.include?(@company) or current_user.admin_companies.include?(@company)
  end

  def authorize_admin
    raise MyException::Unauthorized, "you are not authorized as an admin for company #{@company.id}" unless current_user.admin_companies.include?(@company)
  end

  def show
    render json: @company
  end

  def users
    render json: @company.company_users, each_serializer: CompanyUserForCompanySerializer
  end

  def benefits
    render json: @company.company_benefit_plan_options
  end
end

class Api::V1::UsersController < ApiController
  include UsersControllerShared

  before_action :find_user, except: [:current]
  before_action :authorize_for_user, except: [:current]
  before_action :authorize_company, only: [:benefits]

  def authorize_for_user
    raise MyException::Unauthorized, "you are not authorized as an admin for this user" unless current_user == @user or (current_user.admin_companies & @user.employee_companies).size > 0
  end

  def authorize_company
    find_company
    raise MyException::Unauthorized, "you are not authorized as an admin for company #{@company.id}" unless current_user == @user or current_user.admin_companies.include?(@company)
  end

  def current
    render json: current_user
  end

  def show
    render json: @user
  end

  def companies
    render json: @user.company_users, each_serializer: CompanyUserForUserSerializer, root: 'companies'
  end

  def benefits
    render json: @user.company_benefit_plan_options
  end
end

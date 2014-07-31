class FrontEnd::UsersController < FrontEndController
  include UsersControllerShared

  EMPLOYEE_METHODS = [:benefits]
  before_action :authorize_company_as_admin, except: EMPLOYEE_METHODS
  before_action :authorize_company_as_employee, only: EMPLOYEE_METHODS
  before_action :remember_calling_url, only: [:new, :edit]
  before_action :find_user, except: [:new, :create]

  def authorize_company_as_admin
    find_company
    raise MyException::Unauthorized, "you are not authorized as an admin for company #{params[:company]}" unless current_user.admin_companies.include?(@company)
  end

  def authorize_company_as_employee
    find_company
    raise MyException::Unauthorized, "you are not authorized as an employee for company #{params[:company]}" unless current_user.admin_companies.include?(@company)
  end

  def new
    @user = User.new
  end

  def create
    email = params[:user][:email]
    @user = User.find_by_email(email)
    if @user.nil?
      @user = User.create!(params[:user].permit(:full_name, :email))
    end
    if @user.employee_companies.include?(@company)
      flash = {notice: "#{@user.email} is already an employee of #{@company.full_name}"}
    else
      @company.company_users.create!(user: @user, company_user_type: CompanyUserType::Employee)
      flash = {success: "#{@user.email} added as an employee to #{@company.full_name}"}
    end
    redirect_to calling_url, flash: flash
  end

  def edit
  end

  def update
    redirect_to calling_url
  end

  include UsersHelper

  def benefits
    raise MyException::Unauthorized, "you are not authorized to access the benefits for user #{@user.id}" if @user != current_user
    if request.get?
      remember_calling_url
    end
    redirect_on_exception(calling_url)
    if request.post?
      @company.benefit_types.each do |type|
        type_param = user_benefit_type_select_param(type.name)
        current_user_option = @user.user_company_benefit_plan_options.filter_by_type(type).first
        selected_company_option = CompanyBenefitPlanOption.find_by_id(params[type_param])
        if current_user_option.nil? or selected_company_option.nil? or current_user_option.company_benefit_plan_option.id != selected_company_option.id
          current_user_option.destroy unless current_user_option.nil?
          @user.user_company_benefit_plan_options.create!(company_benefit_plan_option: selected_company_option) unless selected_company_option.nil?
        end
      end
      redirect_to calling_url, flash: {success: 'Benefit selections saved'}
    else
      flash = {alert: 'Invalid benefits request type'}
    end
  end
end

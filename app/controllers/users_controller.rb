class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    company_id = params[:company_id]
    company = Company.find_by_id(company_id)
    if company.nil?
      flash = {:alert=>"Invalid company"}
      render 'new'
      return
    end
    unless current_user.admin_companies.include?(company)
      flash = {:alert=>"You are not an admin for the selected company"}
      render 'new'
      return
    end
    email = params[:user][:email]
    @user = User.find_by_email(email)
    if @user.nil?
      @user = User.create!(params[:user].permit(:full_name, :email))
    end
    if @user.employee_companies.include?(company)
      flash = {notice: "#{@user.email} is already an employee of #{company.full_name}"}
    else
      company.company_users.create!(user: @user, company_user_type: CompanyUserType::Employee)
      flash = {success: "#{@user.email} added as an employee to #{company.full_name}"}
    end
    redirect_to '/', flash: flash
  end

  def edit
    @user = User.find_by_id(params[:id])
    if @user.nil?
      flash = {alert: "User not found"}
    end
  end

  def update
    redirect_to '/'
  end

  include UsersHelper

  def benefits
    @user = current_user
    if request.get?
    elsif request.post?
      company = @user.employee_companies.first
      company.benefit_types.each do |type|
        type_param = user_benefit_type_select_param(type.name)
        current_user_option = @user.user_company_benefit_plan_options.filter_by_type(type).first
        selected_company_option = CompanyBenefitPlanOption.find_by_id(params[type_param])
        if current_user_option.nil? or selected_company_option.nil? or current_user_option.company_benefit_plan_option.id != selected_company_option.id
          current_user_option.destroy unless current_user_option.nil?
          @user.user_company_benefit_plan_options.create!(company_benefit_plan_option: selected_company_option) unless selected_company_option.nil?
        end
      end
      redirect_to '/', flash: {success: 'Benefit selections saved'}
    else
      flash = {alert: 'Invalid benefits request type'}
    end
  end
end

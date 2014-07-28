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
      flash = {:alert=>"User not found"}
    end
  end

  def update
    redirect_to '/'
  end
end

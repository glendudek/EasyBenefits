module UsersControllerShared
  def find_user
    @user = User.find_by_id(params[:id])
    raise MyException::NotFound, "user #{params[:id]} not found" if @user.nil?
  end

  def find_company
    @company = Company.find_by_id(params[:company])
    raise MyException::NotFound, "company #{params[:company]} not found" if @company.nil?
  end
end

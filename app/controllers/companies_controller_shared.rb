module CompaniesControllerShared
  def find_company
    @company = Company.find_by_id(params[:id])
    raise MyException::NotFound, "company #{params[:id]} not found" if @company.nil?
  end
end

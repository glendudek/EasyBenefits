class CompanyUserForCompanySerializer < CompanyUserSerializer
  def include_company?
    false
  end
end

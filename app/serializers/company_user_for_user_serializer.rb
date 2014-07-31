class CompanyUserForUserSerializer < CompanyUserSerializer
  def include_user?
    false
  end
end

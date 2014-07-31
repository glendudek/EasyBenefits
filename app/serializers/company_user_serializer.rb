class CompanyUserSerializer < ActiveModel::Serializer
  attributes :id, :type
  has_one :user
  has_one :company

  def type
    object.company_user_type
  end
end

class CompanySerializer < ActiveModel::Serializer
  attributes :href, :id, :full_name, :name

  def href
    api_v1_company_url(object)
  end
end

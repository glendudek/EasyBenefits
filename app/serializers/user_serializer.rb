class UserSerializer < ActiveModel::Serializer
  attributes :href, :id, :full_name, :email

  def href
    api_v1_user_url(object)
  end
end

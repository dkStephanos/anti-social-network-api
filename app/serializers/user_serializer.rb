class UserSerializer < ActiveModel::Serializer
  attributes :id, :login, :name, :avatar_url, :bio
end

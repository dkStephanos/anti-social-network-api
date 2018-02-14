class UserSerializer < ActiveModel::Serializer
  attributes :id, :login, :name
end

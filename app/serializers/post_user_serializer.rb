class PostUserSerializer < ActiveModel::Serializer
  attributes :id, :login, :avatar_url
end

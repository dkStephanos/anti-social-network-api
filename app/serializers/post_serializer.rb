class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :postType, :photo
end

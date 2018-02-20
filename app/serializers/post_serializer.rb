class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :postType, :photo
  belongs_to :user, serializer: PostUserSerializer
end

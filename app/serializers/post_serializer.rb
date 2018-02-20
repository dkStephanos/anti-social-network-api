class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :postType, :photo
  belongs_to :user, serializer: PostUserSerializer
end

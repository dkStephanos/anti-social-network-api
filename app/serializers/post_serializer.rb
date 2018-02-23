class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :postType, :photo, :picture
  belongs_to :user, serializer: PostUserSerializer
end

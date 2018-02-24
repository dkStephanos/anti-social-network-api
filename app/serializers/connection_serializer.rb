class ConnectionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :connected_user_id
end
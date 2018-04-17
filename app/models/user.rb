class User < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :name, presence: true
    validates :login, presence: true, uniqueness: true

    has_many :connections
  	has_many :connected_users, through: :connections
end

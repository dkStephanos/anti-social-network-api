class Connection < ActiveRecord::Base
  belongs_to :user
  belongs_to :connected_user, class_name: "User"

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?

  def create_inverse
    self.class.create(inverse_connection_options)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_connection_options)
  end

  def inverses
    self.class.where(inverse_connection_options)
  end

  def inverse_connection_options
    { connected_user_id: user_id, user_id: connected_user_id }
  end
end
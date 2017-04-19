class GroupPost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  belongs_to :group
  default_scope -> { order(created_at: :desc) }
end

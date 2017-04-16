class Group < ActiveRecord::Base
    has_many :group_relationships, foreign_key: "group_id", dependent: :destroy
    has_many :members, through: :group_relationships, source: :member
end

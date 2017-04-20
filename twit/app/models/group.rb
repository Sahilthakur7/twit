class Group < ActiveRecord::Base
    has_many :group_relationships, foreign_key: "group_id", dependent: :destroy
    has_many :members, through: :group_relationships, source: :member
    has_many :group_posts

    def admin
        @user = User.find(self.admin_id)
        @user
    end
end

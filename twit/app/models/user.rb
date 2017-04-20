class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true
  
  has_many :microposts, dependent: :destroy
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" } , :default_url => "/images/:style/missing.jpg"
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

 has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
 has_many :following, through: :active_relationships, source: :followed

 has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
 has_many :followers, through: :passive_relationships, source: :follower


 has_many :group_relationships, foreign_key: "member_id", dependent: :destroy
 has_many :joinedgroups, through: :group_relationships, source: :group
 

 has_many :group_posts,dependent: :destroy

 def follow(other_user)
     active_relationships.create(followed_id: other_user.id)
 end

 def unfollow(other_user)
     active_relationships.find_by(followed_id: other_user.id).destroy
 end

 def following?(other_user)
     following.include?(other_user)
 end

 def join(group)
     group_relationships.create(group_id: group.id)
 end

 def unjoin(group)
     group_relationships.find_by(group_id: group.id).destroy
 end

 def joined?(group)
     joinedgroups.include?(group)
 end

 def feed
     following_ids = "SELECT followed_id FROM relationships WHERE follower_id= :user_id"
     Micropost.where("user_id IN (#{following_ids}) OR user_id = :user_id ", user_id: id)
 end

end

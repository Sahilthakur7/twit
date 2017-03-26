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



 def follow(other_user)
     active_relationships.create(followed_id: other_user.id)
 end

 def unfollow(other_user)
     active_relationships.find_by(followed_id: other_user.id).destroy
 end

 def following?(other_user)
     following.include?(other_user)
 end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true
  
  has_many :microposts, dependent: :destroy
  has_attached_file :avatar, :styles => { :medium => "300*300", :thumb => "100*100#" } , :default_url => "/images/:style/missing.jpg"
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

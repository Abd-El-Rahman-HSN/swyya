class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  has_attached_file :personal_photo, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: "/images/missing.png"
  validates_attachment_content_type :personal_photo, content_type: /\Aimage/
  
  before_create :assign_role_to_user

  private

  def assign_role_to_user
    add_role(ROLES[:user]) if roles.blank?
  end
end

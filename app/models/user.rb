# == Schema Information
#
# Table name: users
#
#  id                         :uuid             not null, primary key
#  admin                      :boolean          default(FALSE)
#  announcements_last_read_at :datetime
#  current_sign_in_at         :datetime
#  current_sign_in_ip         :string
#  email                      :string           default(""), not null
#  encrypted_password         :string           default(""), not null
#  first_name                 :string
#  last_name                  :string
#  last_sign_in_at            :datetime
#  last_sign_in_ip            :string
#  remember_created_at        :datetime
#  reset_password_sent_at     :datetime
#  reset_password_token       :string
#  role                       :integer          default("user")
#  sign_in_count              :integer          default(0), not null
#  username                   :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  company_id                 :uuid
#
# Indexes
#
#  index_users_on_company_id            (company_id)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class User < ApplicationRecord
  after_initialize :set_default_role, if: :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_one_attached :avatar
  has_person_name
  has_noticed_notifications

  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :services
  belongs_to :company, optional: true

# Roles, add other roles as required
  enum role: {
    user: 0,
    member: 1
  }
  
  private 

  def set_default_role
    self.role ||= :user
  end 

  # Example user from_omniauth method not actioned.
  def self.from_omniauth(auth) 
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.username = auth.info.username   # assuming the user model has a username
		  user.email = auth.info.email
		  user.password = Devise.friendly_token[0,20]
      user.avatar.attach(io: open(auth.info.image), filename: "#{auth.info.username}.jpg")
	  end
  end

end

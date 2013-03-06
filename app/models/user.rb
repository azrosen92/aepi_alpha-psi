# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  year            :string(255)
#  position        :string(255)
#  bio             :string(255)
#  status          :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :year,
									:position, :bio, :status
	has_secure_password
	
	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
										format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }
	validates :password_confirmation, presence: true
	POSITIONS = ["master", "lieutenant", "exchecquer", "scribe", "sentinal"]
	STATUS = ["brother", "parent"]
	validates :position, :inclusion => { :in => POSITIONS }, :allow_blank => true
	validates :status, :inclusion => { :in => STATUS }, :allow_blank => true

	private

		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
end

class UserEntity < ApplicationRecord

has_many :offers, dependent: :destroy
has_many :offers, dependent: :destroy
	has_many :active_relationships, class_name: "Relationship",
								   foreign_key: "follower_id",
									 dependent:  :destroy


has_many :passive_relationships, class_name: "Relationship",
								foreign_key: "followed_id",
								  dependent:  :destroy

has_many :following, through: :active_relationships, source: :followed
has_many :followers, through: :passive_relationships, source: :follower
attr_accessor :remember_token, :activation_token, :reset_token

before_save { email.downcase! }
validates :name, presence: true, length: { maximum: 50 }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 255 },
format: { with: VALID_EMAIL_REGEX },
uniqueness: true

has_secure_password
validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

def UserEntity.new_token
	SecureRandom.urlsafe_base64
end

def create_reset
	self.reset_token = UserEntity.new_token
	update_attribute(:reset_digest, UserEntity.digest(reset_token))
	update_attribute(:reset_sent_at, Time.zone.now)
end

def send_email
	UserEntityMailer.password_reset(self).deliver_now
end

def UserEntity.digest(string)
	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
end

def remember
	self.remember_token = UserEntity.new_token
    update_attribute(:remember_digest, UserEntity.digest(remember_token))
end


def authenticated?(remember_token)
	return false if remember_digest.nil?
	BCrypt::Password.new(remember_digest).is_password?(remember_token)
end

def forget
	update_attribute(:remember_digest, nil)
end

def feed
	Offer.where("user_entity_id = ?", id)
end

def follow(other_user_entity)
	following << other_user_entity
end

def unfollow(other_user_entity)
	following.delete(other_user_entity)
end

def following?(other_user_entity)
	following.include?(other_user_entity)
end

end

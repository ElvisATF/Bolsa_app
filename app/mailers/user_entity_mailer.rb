class UserEntityMailer < ApplicationMailer

	def password_reset(user_entity)
		@user_entity = user_entity
		mail to: user_entity.email, subject: "Password reset"
	end
end
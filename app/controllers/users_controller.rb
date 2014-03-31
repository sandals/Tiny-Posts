class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(users_parameters)

		if @user.save
			sign_in(@user)
			redirect_to posts_path
		else
			render :new
		end
	end

	private
		# only allow content and author data to be submitted.
		def users_parameters
			params.require(:user).permit(:email)
		end
end
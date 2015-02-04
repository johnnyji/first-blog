class AuthorSessionsController < ApplicationController
	def new
	end

	def create
		if login(params[:email], params[:password])
			redirect_to root_path
			flash.notice = "Welcome back Johnny ;)"
		else
			flash.now.alert = "Login failed!"
			render action: :new
		end
	end

	def destroy 
		logout
		redirect_to(:authors, notice: 'Logged out!')
	end
end

class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.where(:email => params[:signin][:email]).first
		
		if user && user.authenticate(params[:signin][:password])
			session[:user_id] = user.id
			flash[:notice] = "¡Bienvenido!"
			redirect_to root_url
		else
			flash[:error] = "Email o Password Incorrectos, trata nuevamente."
			render :new
		end
	end

	def destroy
    	session[:user_id] = nil
    	flash[:notice] = "Nos vemos."

    	redirect_to root_url
  	end
  	
end
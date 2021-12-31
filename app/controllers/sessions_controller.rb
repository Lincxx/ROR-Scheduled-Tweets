class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:email])
        # authenticate, comes for the user model has_secure_password
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged in successfully"
        else 
            flash[:alert] = "Invalid email or password"
            render :new #takes them back to the sessions/new.html.erb
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out"
    end

end
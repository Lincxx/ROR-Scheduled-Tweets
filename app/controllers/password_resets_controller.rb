class PasswordResetsController < ApplicationController 

    def new
        
    end

    def create
        @user = User.find_by(email: params[:email])

        if @user.present?
            #send email
            PasswordMailer.with(user: @user).reset.deliver_now
            #deliver_later will send this to a background job
        else
        end

        #we will send this whether or not the user was found in the db.
        redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password?"
    end
end
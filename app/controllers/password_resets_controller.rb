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

    def edit 
        # find_signed! will throw an error
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, alert: "Your token has expired. Please try again."
        #binding.irb
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Your password was reset successfully. Please sign in"
        else
            render :edit #render the edit page
        end
    end

    private
    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
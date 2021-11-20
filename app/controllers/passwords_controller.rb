class PasswordsController < ApplicationController
    #check to make sure the user is logged in
    before_action :require_user_logged_in!
    
    def edit
    end 

    def update
       if Current.user.update(password_params)
    end

    private
    def password_params
        pa
end 
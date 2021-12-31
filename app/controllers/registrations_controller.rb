class RegistrationsController < ApplicationController
    def new 
      @user = User.new      
    end

    def create
        #render plain: 'Thanks' 
        #render plain: params[:user]
        #params[:user] will get us {"authenticity_token"=>"[FILTERED]", "user"=>{"email"=>"bossco28@gmail.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Sign Up"}

        @user = User.new(user_params)
        if @user.save
          #setup a cookie
          session[:user_id] = @user.id #this is more secure, than using the cookie which could be altered in the browser
          redirect_to root_path, notice: "Successfully created account"
        else
            #this will go to views/registration/new.html.erd and rerender it
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
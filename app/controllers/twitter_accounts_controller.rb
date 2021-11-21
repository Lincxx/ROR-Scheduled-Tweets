class TwitterAccountsController < ApplicationController
    before_action :require_user_logged_in!
    def index
        @twitter_accounts = Current.user.twitter_accounts
    end

    def destroy
        # look up the twitter account
        @twitter_account = Current.user.twitter_accounts.find(params[:id])
        #destroy the account
        @twitter_account.destroy
        redirect_to twitter_accounts_path, notice: "successfully disconnected @#{@twitter_account.username}"
    end
end
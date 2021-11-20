class Current < ActiveSupport::CurrentAttributes
    # Here we can assign items such as user, timezone, account thy are on, those types of details, that pretain to the current request. So when someone opens the website, they may not be logged in, so current user will be nil, so the inverse for someone who is already logged in, they current user will be them

    #this does not have to be used "GoRails", but is easy to use
    attribute :user

end
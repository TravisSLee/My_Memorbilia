class ApplicationController < ActionController::Base
    helper_method :require_login
    
    def welcome
        if user_signed_in?
            @user = current_user
        end
    end

    def require_login
        unless current_user
          redirect_to root_url
        end
    end
end

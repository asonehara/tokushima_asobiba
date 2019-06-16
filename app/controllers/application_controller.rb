class ApplicationController < ActionController::Base
    
    include SessionsHelper
    
    private
    
    def require_user_logged_in
        unless logged_in?
            redirect_to login_url
        end
    end
    
    def require_admin_user
        unless admin?
            redirect_to root_url
        end
    end
    
    def counts(user)
        @count_likes = user.likes.count
    end
end

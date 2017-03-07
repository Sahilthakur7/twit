class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @microposts = @user.microposts.paginate(page: params[:page])
    end

    def update
        
         redirect_to user_path(current_user)
    end

end

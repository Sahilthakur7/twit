class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @microposts = @user.microposts.paginate(page: params[:page])
    end

    def update
        
         redirect_to user_path(current_user)
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 5)

    end

    def following
        @title = "FOLLOWING"
        @user = User.find(params[:id])
        @users = @user.following.paginate(page: params[:page])
        render 'show_follow'
    end

    def followers
        @title = "FOLLOWERS"
        @user = User.find(params[:id])
        @users = @user.followers.paginate(page: params[:page])
        render 'show_follow'
    end
end

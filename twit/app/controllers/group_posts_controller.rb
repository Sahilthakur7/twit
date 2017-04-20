class GroupPostsController < ApplicationController

    def create
        @grouppost = current_user.group_posts.build(group_post_params) 
        @group = Group.find([params[:group_id]])
        @grouppost.group = @group.last
        if @grouppost.save
            flash[:success] = "Post created! "
           redirect_to group_path(@group)
        end
    end


    private
    def group_post_params
        params.require(:group_post).permit(:content,:picture)

    end
end

class GroupsController < ApplicationController
    
    def new
        @group = Group.new
    end


    def create
        @group = Group.create(group_params)
        @group.admin_id = current_user.id
        current_user.join(@group)
        if @group.save
            
            flash[:success]= "Group has been created."
            redirect_to groups_path
        end
    end

    def index
        @groups = Group.paginate(page: params[:page], per_page: 5)
    end

    def show
        @group = Group.find(params[:id])
        @user = current_user
        @grouppost = current_user.group_posts.build if signed_in?
        @groupposts = @group.group_posts
    end

    private
    
    def group_params
        params.require(:group).permit(:name,:description,:admin_id)
    end

end

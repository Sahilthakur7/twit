class GroupRelationshipsController < ApplicationController
    def create
        @group = Group.find(params[:group_id])
        current_user.join(@group)
        respond_to do |format|
            format.html { redirect_to @user }
            format.js
        end

    end

    def destroy
        @group = GroupRelationship.find(params[:id]).group

        current_user.unjoin(@group)
        respond_to do |format|
            format.html { redirect_to @user }
            format.js
        end

    end
end

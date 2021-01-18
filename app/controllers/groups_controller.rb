class GroupsController < ApplicationController

    before_action :redirect_if_not_logged_in

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            if current_user
                @group = @user.groups.build
            end
        else
            redirect_to groups_path
        end
    end

    def create
        @group = current_user.groups.build(group_params)
        if @group.save
            redirect_to groups_path
        else
            render :new
        end
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @groups = @user.groups
        else
            flash[:message] = "That group does not exist!" if params[:user_id]
            @groups = Group.all
        end
    end

    def show
        @group = Group.find(params[:id])
        @memberships = @group.memberships
        redirect_to '/' if !@group
    end

    private

    def group_params
        params.require(:group).permit(:title, :description, :rules)
    end
end

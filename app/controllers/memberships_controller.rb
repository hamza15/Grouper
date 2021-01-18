class MembershipsController < ApplicationController

    def index
        if params[:group_id] && @group = Group.find_by_id(params[:group_id])
            @memberships = @group.memberships
        else
            @error = "That membership does not exist!" if params[:group_id]
            @memberships = Membership.all
        end
    end

    def create

    end

    private

    def membership_params
        params.require(:comment).permit(:moderator, :group_id)
    end
end

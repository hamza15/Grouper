class MeetingsController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index
        if params[:group_id] && @group = Group.find_by_id(params[:group_id])
            @meetings = @group.meetings
         else
           @error = "That group doesn't exist" if params[:group_id]
           @meetings = Meeting.all
         end
    end

    def new
        if params[:group_id] && @group = Group.find_by_id(params[:group_id])
            @meeting = @group.meetings.build
            @groups = Group.all.my_groups(current_user.id)
          else
            @error = "That group doesn't exist" if params[:group_id]
            @meeting = Meeting.new
          end
    end

    def create
        if params[:group_id] && @group = Group.find_by_id(params[:group_id])
            @meeting = @group.meetings.build(meeting_params)
            if @meeting.save
                redirect_to group_meetings_path
            else
                render :new
            end
        else
            redirect_to '/'
        end
    end

    def show
        @meeting = Meeting.find(params[:id])
    end

    def edit
        @meeting = Meeting.find(params[:id])
    end

    def update
        @meeting = Meeting.find(params[:id])
        if @meeting.update(meeting_params)
            redirect_to meeting_path(@meeting)
        else
            render :edit
        end
    end

    def destroy
        @meeting = Meeting.find(params[:id])
        @meeting.destroy
        redirect_to meetings_url
    end

    private

    def meeting_params
        params.require(:meeting).permit(:name, :start_time, :group_id)
    end
end
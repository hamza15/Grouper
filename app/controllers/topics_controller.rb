class TopicsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :redirect_if_not_topic_user, only: [:edit, :update]
    
    def index
        if params[:group_id] && @group = Group.find_by_id(params[:group_id])
           @topics = @group.topics
        else
          @error = "That group doesn't exist" if params[:group_id]
          @topics = Topic.all
        end
    end

    def new
        if params[:group_id] && @group = Group.find_by_id(params[:group_id])
            @topic = @group.topics.build
            @groups = Group.all.my_groups(current_user.id)
          else
            @error = "That group doesn't exist" if params[:group_id]
            @topic = Topic.new
          end
    end
      
    def create
        @topic = current_user.topics.build(topic_params)
        if @topic.save
        redirect_to topics_path
        else
        render :new
        end
    end

    def update
        if @topic.update(topic_params)
          redirect_to topic_path(@topic)
        else
          render :edit
        end
    end

    def show
        @topic = Topic.find_by_id(params[:id])
        redirect_to topics_path if !@topic
    end

    private

    def topic_params
        params.require(:topic).permit(:title,:group_id)
    end

    def redirect_if_not_topic_user
        redirect_to topics_path if @topic.user != current_user
    end

end
class TopicsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_topic, only: [:show, :edit, :update]
    
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
      if params[:group_id] && @group = Group.find_by_id(params[:group_id])
        @topic = current_user.topics.build(topic_params)
        if @topic.save
            redirect_to group_topics_path
        else
            render :new
        end
      else
        redirect_to '/'
      end
    end

    def edit
    end

    def show
    end

    def update
        if @topic.update(topic_params)
          redirect_to topic_path(@topic)
        else
          render :edit
        end
    end

    def destroy
        @topic = Topic.find(params[:id])
        if @topic.user == current_user
          @topic.destroy
          redirect_to topics_url
        else
          render :show
        end
    end

    private

    def topic_params
        params.require(:topic).permit(:title,:group_id)
    end

    def set_topic
        @topic = Topic.find_by(id: params[:id])
        if !@topic
          flash[:message] = "Topic was not found"
          redirect_to topics_path
        end
    end

end
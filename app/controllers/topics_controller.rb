class TopicsController < ApplicationController
	def index
    	@topics = Topic.all

  		if params[:id]
			@topic = Topic.find(params[:id])
			@sub = "Update"
		else
			@topic = Topic.new
			@sub = "new"
		end

  		sort_by = (params[:order] == 'comments_count') ? 'comments_count desc' : 'created_at'
 		@topics = @topics.order(sort_by).page(params[:page]).per(5)
 	end

 	def new
		@topic=topic.new
	end

	def create
		@topic = Topic.new(topic_params)
		if @topic.save(topic_params)
			flash[:notice]="topic saved successfully"
			redirect_to topics_path
		else
			flash[:alert]="topic not saved "
			render "new"
		end		
	end

	private

	def topic_params
	  params.require(:topic).permit(:title,:content)
	end

end

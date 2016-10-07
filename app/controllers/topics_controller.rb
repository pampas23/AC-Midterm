class TopicsController < ApplicationController
	
	before_action :set_topic, :only =>[:show, :edit ,:update,:destroy]

	def set_topic
		@topic=Topic.find(params[:id])
	end

	def index
    	@topics = Topic.all

  		if params[:id]
			@topic = Topic.find(params[:id])
			@sub = "更新"
		else
			@topic = Topic.new
			@sub = "新增"
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
			redirect_to topics_path
		else			
			render "new"
		end		
	end

	def show
		@comment=@topic.comments
		@comment_new = @topic.comments.new 
	end

	private

	def topic_params
	  params.require(:topic).permit(:title,:content)
	end

end

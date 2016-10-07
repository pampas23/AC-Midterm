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
end

class TopicCommentsController < ApplicationController

	def index
		
	end

	def create
		@topic=Topic.find(params[:topic_id])
		@comment = @topic.comments.new(comment_params)

		if @comment.save(comment_params)
			flash[:notice]="comment saved successfully"
			redirect_to topic_path(@topic)
		else
			flash[:alert]="comment not saved "
			render "new"
		end
	end

private
	
	def comment_params
		params.require(:comment).permit(:comment)
	end


end

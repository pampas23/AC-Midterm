class TopicCommentsController < ApplicationController

	def index
		
	end

	def create
		@topic=Topic.find(params[:topic_id])
		@comment = @topic.comments.new(comment_params)
		@comment.user = current_user

		if @comment.save(comment_params)
			flash[:notice]="comment saved successfully"
			redirect_to topic_path(@topic)
		else
			flash[:alert]="comment not saved "
			render topic_path(@topic)
		end
	end

	def destroy
		@topic=Topic.find(params[:topic_id])
		@comment=@topic.comments.find(params[:id])
		@comment.destroy
		redirect_to :back
	end

private
	
	def comment_params
		params.require(:comment).permit(:comment,:user_id)
	end


end

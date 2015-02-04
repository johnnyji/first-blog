class CommentsController < ApplicationController
	before_filter :require_login, except: [:create]
	
	def create
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]
		if @comment.save
			flash.notice = "thanks for the comment!"
			redirect_to article_path(@comment.article)
		else
			redirect_to article_path(@comment.article)
			flash.notice = "your comment wasn't saved properly!"
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@comment.article)
	end

	private
	def comment_params
		params.require(:comment).permit(:author_name, :body)
	end
end

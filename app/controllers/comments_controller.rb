class CommentsController < ApplicationController
	before_filter :require_login, except: [:create]
	
	def create
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]
		@comment.save ? redirect_to(article_path(@comment.article), notice: 'Thanks for the comment!') : redirect_to(article_path(@comment.article), notice: 'You\'re comment wasn\'t properly saved!')
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

	def refresh_with_message(message)
		redirect_to article_path(@comment.article), notice: message
	end
	
end

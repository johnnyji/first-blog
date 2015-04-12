class ArticlesController < ApplicationController
before_filter :require_login, except: [:index, :show]

	def index
		@articles = Article.all.order('created_at DESC')
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article_id
		@comments = @article.comments.order('created_at DESC')
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			flash.notice = "You've just posted #{@article.title}"
			redirect_to article_path(@article)
		else
			flash.notice = "Your post wasn't saved properly!"
			render("new")
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update_attributes(article_params)
		flash.notice = "#{@article.title} has successfully been updated!"
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash.notice = "#{@article.title} has been forever deleted!"
		redirect_to articles_path
	end

	private
	def article_params
		params.require(:article).permit(:title, :body, :image)
	end
end

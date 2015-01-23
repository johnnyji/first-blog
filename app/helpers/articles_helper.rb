module ArticlesHelper
	def article_params
    params.require(:article).permit(:title, :body, :image)
  end
end

class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  before_filter :zero_authors_or_authenticated, only: [:new, :create]
  before_filter :require_login, except: [:new, :create]

  def index
    @authors = Author.all
  end

  def show
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
    @author.save ? redirect_to(root_path, notice: 'Author was successfully created.') : render('new')
  end

  def update
    @author.update(author_params) ? redirect_to(root_path, notice: 'Author was successfully updated.') : render(:edit)
  end

  def destroy
    @author.destroy
    redirect_to(authors_url, notice: 'Author was successfully destroyed.')
  end

  private

    def set_author
      @author = Author.find(params[:id])
    end

    def zero_authors_or_authenticated
      unless Author.count == 0 || current_user
        redirect_to root_path
        return false
      end
    end

    def author_params
      params.require(:author).permit(:username, :email, :password, :password_confirmation)
    end
end

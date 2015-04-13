class ApplicationController < ActionController::Base
  respond_to :html, :js, :json
  protect_from_forgery with: :exception
end

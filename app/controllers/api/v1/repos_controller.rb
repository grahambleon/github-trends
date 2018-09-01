class Api::V1::ReposController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  def index
    render json: Repo.all
  end

end

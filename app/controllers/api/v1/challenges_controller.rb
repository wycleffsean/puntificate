class Api::V1::ChallengesController < ApplicationController
  respond_to :json

  def index
    respond_with Challenge.all
  end

  def show
    respond_with Challenge.find(params[:id])
  end

end

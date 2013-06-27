class Api::V1::ChallengesController < ApplicationController
  respond_to :json

  def index
    respond_with Challenge.all
=begin
    @c = Challenge.includes(:responses).all
    respond_to do |format|
    	format.json { render json: { challenges: @c.to_json(includes: :responses) }}
    end
=end
  end

  def show
    respond_with Challenge.find(params[:id])
  end
end

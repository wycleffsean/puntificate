class ResponsesController < ApplicationController
  respond_to :html

  def index
    respond_with Response.all
  end

  def show
    respond_with Response.find(params[:id])
  end

  def create
    challenge = Challenge.find(params[:challenge_id])
    response = challenge.responses.build(params[:response])

    if response.save
      redirect_to challenge_path(response.challenge)
    end
  end

end
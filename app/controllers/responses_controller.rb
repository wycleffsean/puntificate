class ResponsesController < ApplicationController
  respond_to :html

  def index
    respond_with Response.all
  end

  def show
    respond_with Response.find(params[:id])
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @new_response = @challenge.responses.build(params[:response])
    @new_response.save
    redirect_to challenge_path(@new_response.challenge)    
  end

end
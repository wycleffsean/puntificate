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
    @new_response.user = current_user
    @new_response.save
    redirect_to challenge_path(@new_response.challenge)    
  end

  def destroy
    @response = Response.find params[:id]
    authorize! :destroy, @response
    @response.destroy
    redirect_to challenge_path(params[:challenge_id])
  end

  def upvote
    response = Response.find(params[:response_id])
    case current_user.voted_as_when_voted_for response
    when nil, false
      response.vote_from current_user
    when true
      response.unvote voter: current_user
    else
    end
    #current_user.voted_for?(response) ?  :     
    redirect_to challenge_path(params[:challenge_id])
  end

  def downvote
    response = Response.find(params[:response_id])
    case current_user.voted_as_when_voted_for response
    when nil, true
      response.downvote_from current_user
    when false
      response.unvote voter: current_user
    else
    end
    redirect_to challenge_path(params[:challenge_id])
  end

end
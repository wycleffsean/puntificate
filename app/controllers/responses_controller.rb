class ResponsesController < ApplicationController
  respond_to :html

  def index
    respond_with Response.all
  end

  def show
    @response = Response.find(params[:id])
    respond_with @response
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
    when nil
      response.vote_from current_user
      response.user.change_score(1)
    when false
      response.vote_from current_user
      response.user.change_score(2)
    when true
      response.unvote voter: current_user
      response.user.change_score(-1)
    else
    end
    #current_user.voted_for?(response) ?  :     
    redirect_to challenge_path(params[:challenge_id])
  end

  def downvote
    response = Response.find(params[:response_id])
    authorize! :vote, response
    if can? :vote, response #Rails.env.production? && current_user != response.user
      case current_user.voted_as_when_voted_for response
      when nil
        response.downvote_from current_user
        response.user.change_score(-1)
      when true
        response.downvote_from current_user
        response.user.change_score(-2)
      when false
        response.unvote voter: current_user
        response.user.change_score(1)
      else
      end
    end
    redirect_to challenge_path(params[:challenge_id])
  end

end

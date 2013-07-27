class ChallengesController < ApplicationController
  respond_to :html

  def index
    @challenges = Challenge.future
  end

  def show
    @challenge = Challenge.includes(:responses).find(params[:id])
    @new_response = Response.new
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(params[:challenge])
    @challenge.user = current_user
    if @challenge.save
      redirect_to challenge_url(@challenge), success: "Challenge created"
    else
      render :action => :create
    end
  end
=begin  
  def edit
    @challenge = Challenge.find params[:id]
  end

  def update
    @challenge = Challenge.find params[:id]
    if @challenge.update_attributes params[:challenge]
      redirect_to challenges_path
    else
      render :action => :edit
    end
  end
=end
  def destroy
    @challenge = Challenge.find params[:id]
    authorize! :destroy, @challenge
    @challenge.destroy
    redirect_to challenges_path
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
    
    redirect_to challenge_path(params[:challenge_id])
  end

end
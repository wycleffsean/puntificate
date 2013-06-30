class ChallengesController < ApplicationController
  respond_to :html

  def index
    @challenges = Challenge.all
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
    challenge = Challenge.find(params[:challenge_id])
    render text: "up id:#{params[:challenge_id]}"
    throw
  end

end
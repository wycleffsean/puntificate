class ChallengesController < ApplicationController
  respond_to :html

  def index
    respond_with @challenges = Challenge.all
  end

  def show
    respond_with @challenge = Challenge.includes(:responses).find(params[:id])
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(params[:challenge])

    if @challenge.save
      redirect_to challenge_url(@challenge), success: "Challenge created"
    else
      render :action => :create
    end
  end
  
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
end
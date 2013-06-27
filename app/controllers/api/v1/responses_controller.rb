class Api::V1::ResponsesController < ApplicationController
  respond_to :json

  def index
    respond_with Response.all
  end

  def show
    respond_with Response.find(params[:id])
  end
end
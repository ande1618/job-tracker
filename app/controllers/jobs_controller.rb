class JobsController < ApplicationController
  def index
    # byebug
    if params[:sort] == "location"
      @jobs = Job.order(:city)
    elsif params[:sort] == "level_of_interest"
      @jobs = Job.order(:level_of_interest)
    elsif params[:location]

      @jobs = Job.where("city = ? ", params[:location])
    end
  end
end

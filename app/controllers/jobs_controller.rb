class JobsController < ApplicationController
  def index
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
      # redirect_to company_jobs_path(@company)
    else
      @jobs = Job.all
    end
  end

  def new
    @categories = Category.all.order(:title)
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @categories = Category.all.order(:title)
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

 def update
    @job = Job.find(params[:id])
      if @job.update_attributes(job_params)
        redirect_to company_job_path
      else
        render :edit
      end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:success] = "#{@job.title} was successfully deleted!"
    redirect_to company_jobs_path
  end

  # def search_post
  #   redirect_to search_jobs_path(params[:q])
  # end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end

class CommentsController < ApplicationController

  def create
    # @job = Job.find(params[:job_id]
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]

    @comment.save
        # flash[:success] = "You created a comment for #{@job.title}"
    # redirect_to company_job_path(company, job)
    redirect_to company_job_path(@comment.job.company, @comment.job)
    end

    # def show
    #   @job = Job.find(params[:job_id]
    #   @comment = Comment.find(params[:id])
    # end

    private

    def comment_params
      params.require(:comment).permit(:author_name, :body)
    end
end

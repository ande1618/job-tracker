class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]

    @comment.save
    redirect_to company_job_path(@comment.job.company, @comment.job)
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      flash[:success] = "Comment successfully deleted!"
      redirect_to company_job_path(@comment.job.company, @comment.job)
    end

    private

    def comment_params
      params.require(:comment).permit(:author_name, :body)
    end
end

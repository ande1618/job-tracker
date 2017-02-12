class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
      if @category.save
        flash[:success] = "You created a #{@category.title} category!"
        redirect_to @category
      else
        flash[:failure] = "#{@category.title} category already exists!"
        redirect_to new_category_path
      end
  end

  def show
    # @company = Company.find(params[:id])
    @category = Category.find(params[:id])
    @jobs = Job.where(category: @category)
    # byebug
    # @jobs = Job.where(Category.find(params[:id]))
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to category_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "#{@category.title} was successfully deleted!"
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end

class CategoriesController < ApplicationController
 before_action :require_user
 before_action :require_admin, only: [:destroy]
  
  def index
    @categories = Category.paginate(page: params[:page], per_page: 20)
  end
  
  
  def new
    @category = Category.new
  end
  
#  def edit
#  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end
  

 # def update
 #   if @category.update(category_params)
#      flash[:success] = "Category was successfully updated"
#      redirect_to category_path(@category)
#    else
#      render 'edit'
#    end
#  end


  def show
    
  end
  
  def destroy
    @category.destroy
    flash[:danger] = "Category was successfully deleted"
    redirect_to categories_path
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end
  
  
# Only admins can delete categories 
  def require_admin
   if !current_user.admin?
      flash[:danger] = "Only an Admin can perform that action"
      redirect_to categories_path
    end
  end
end


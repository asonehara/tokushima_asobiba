class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @spots = @category.spots
  end
end

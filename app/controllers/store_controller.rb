class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
  end

  def show
    @product = Product.find(params[:id])
  end

end

class StoreController < ApplicationController
  include CurrentCart
  before_action :get_cart

  def index
    @products = Product.order(:title)
  end

  def show
    @product = Product.find(params[:id])
  end

end

class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create, :update, :destroy]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
# GET

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
      product = Product.find(params[:product_id])
      quantity = params[:product_quantity].to_i
      item_status = @cart.add_product(product, product.id, quantity)
      if  item_status == 1 #enough product && > quantity
        @notice = "You have added " + quantity.to_s + " " + product.title + "!"
        @add_class = "alert-success"
      elsif item_status == 0 # sold out
        @notice = product.title + " -- Sold out"
        @add_class = "alert-warning"
      elsif item_status == -1 #not enough
        @notice = "Not enough stock. Only " + product.product_stock.to_s + " " + product.title + " left in stock !"
        @add_class = "alert-danger"
      end
      respond_to do |format|
        format.js
      end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    if params[:commit] == 'Add'
      current_quantity = params[:product_quantity].to_i + 1
      stock_status = @line_item.product.has_enough_products(current_quantity)
      update_quantity(stock_status, "add")
    end

    if params[:commit] == 'Reduce'
      if params[:product_quantity].to_i > 1 #at least 1
        current_quantity = params[:product_quantity].to_i - 1
          stock_status = @line_item.product.has_enough_products(current_quantity)
          update_quantity(stock_status, "reduce")
      else #1
        @notice = "Only one in your cart. You can only remove it."
        @add_class = "alert-danger"
      end
    end

    respond_to do |format|
      format.js
    end

    # respond_to do |format|
    #   if @line_item.update(line_item_params)
    #     format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @line_item }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @line_item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    @line_items = @cart.line_items
    respond_to do |format|
      format.html { redirect_to @line_item.cart, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id, :quantity, :unit_price, :total_price)
    end

  def update_quantity(stock_status, user_action)
    if stock_status == 1
      if user_action == "add"
        @line_item.quantity += 1
        @notice = "You added one item. There is(are) " +  @line_item.quantity.to_s + " item in the cart."
      elsif user_action == "reduce"
          @line_item.quantity -= 1
          @notice = "You reduced one item. There is(are) " +  @line_item.quantity.to_s + " item in the cart."
      end
      @add_class = "alert-success"
      @line_item.save!
    end
    if stock_status == 0
      @notice = "Sold out already. Remove it."
      @add_class = "alert-warning"
      @line_item.destroy
    end
    if stock_status == -1
      @notice  = "Not enough stock. Only " + @line_item.product.product_stock.to_s + " item left in the stock."
      @add_class = "alert-danger"
    end
    return @notice,@add_class
  end

end

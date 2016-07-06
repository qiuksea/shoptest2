class Admin::ProductCategoriesController <  Admin::ApplicationController
  before_action :set_admin_product_category, only: [:show, :edit, :update, :destroy]

  # GET /admin/product_categories
  # GET /admin/product_categories.json
  def index
    @product_categories = ProductCategory.all
  end

  # GET /admin/product_categories/1
  # GET /admin/product_categories/1.json
  def show
  end

  # GET /admin/product_categories/new
  def new
    @product_category = ProductCategory.new
  end

  # GET /admin/product_categories/1/edit
  def edit
  end

  # POST /admin/product_categories
  # POST /admin/product_categories.json
  def create
    @product_category = ProductCategory.new(product_category_params)

    respond_to do |format|
      if @product_category.save
        format.html { redirect_to [:admin,@product_category], notice: 'Product category was successfully created.' }
        format.json { render :show, status: :created, location: @admin_product_category }
        format.js
      else
        format.html { render :new }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/product_categories/1
  # PATCH/PUT /admin/product_categories/1.json
  def update
    respond_to do |format|
      if @product_category.update(product_category_params)
        format.html { redirect_to [:admin,@product_category], notice: 'Product category was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin,@product_category] }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/product_categories/1
  # DELETE /admin/product_categories/1.json
  def destroy
    @product_category.destroy
    respond_to do |format|
      format.html { redirect_to [:admin,product_categories_url], notice: 'Product category was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product_category
      @product_category = ProductCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_category_params
      params.require(:product_category).permit(:name)
    end
end

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if params[:q]
      search_term = params[:q]
      @products = Product.search(search_term)
    else
      @products = Product.created_desc.all
      @popular_product = Product.joins(:comments).where('comments.rating > ?', 4)
    end 
  end

  def popular_product
    @popular_product = Product.joins(:comments).where('comments.rating > ?', 4)
    #if product.comments.rating > 4
     # @product = @popular_product

      #$redis.hmset(product.average_rating, product.id, product.image_url)
      #$redis.hmget(product.average_rating, product.id, product.image_url)
    #end 
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @comments = @product.comments.order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
  end

  # GET /products/new
  def new
    if signed_in? && current_user.admin? 
      @product = Product.new
    else
      redirect_to root_path 
    end
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to "/simple_pages/about", notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: "/simple_pages/about" }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :colour, :price)
    end
end
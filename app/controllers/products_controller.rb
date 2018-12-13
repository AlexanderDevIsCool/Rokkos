class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    unless params[:tags].nil?
      product_ids = []
      tags_counter = params[:tags].length
      Tag.where(name: params[:tags]).each do |tag|
        product_ids.append(tag.product_id)
      end

      b = Hash.new(0)

      product_ids.each do |v|
        b[v] += 1
      end

      product_ids.clear

      b.each do |k, v|
        if v == tags_counter
          product_ids.append(k)
        end
      end


      @products = Product.where(id: product_ids.uniq)
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
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
        Tag.create(product_id: @product.id)
        format.html { redirect_to @product, notice: 'Товар успішно створено.' }
        format.json { render :show, status: :created, location: @product }
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
        format.html { redirect_to @product, notice: 'Товар оновлено.' }
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
    @product = Product.find_by(id: params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Товар видалено.' }
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
      params.require(:product).permit(:name, :description, :sale_price,
                                      :quantity, :sort_type, attachments: [])
    end
end

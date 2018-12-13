class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
    @products = Product.all
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @product = Product.find_by(id: @tag.product_id)
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
    @product = Product.find_by(id: params[:id])
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Тег успішно додано.' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    @product = Product.find_by(id: params[:product_id])
    tags_in_str = params[:tags].split(' ')
    tags_in_str.each do |tag|
      Tag.create(product_id: @product.id, name: "##{tag}")
    end
    redirect_to tags_path
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    product_id = @tag.product_id
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to edit_tag_path(product_id), notice: 'Тег видалено.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name)
    end

    def tag_edit_params
      params.require(:tag).permit(:tags, :product_id)
    end
end

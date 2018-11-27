class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(user_id: current_user.id) if logged_in?
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @product = Product.find_by(id: @order.product_id)
  end

  # GET /orders/new
  def new
    @order = Order.new
    @user = User.find_by(id: new_order_params[:user_id])
    @product = Product.find_by(id: new_order_params[:product_id])
    @quantity = new_order_params[:quantity]
    @order_price = (@product.sale_price.to_i * @quantity.to_i).to_s
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        @order.order_create
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:full_name, :city, :mobile,
                                    :email, :user_id, :order_type,
                                    :order_address, :quantity, :order_price,
                                    :post_number, :product_id)
    end

    def new_order_params
      params.require(:order).permit(:product_id, :user_id, :quantity)
    end
end

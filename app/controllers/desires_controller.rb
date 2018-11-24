class DesiresController < ApplicationController
  before_action :set_desire, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: %i[create destroy]
  # GET /desires
  # GET /desires.json
  def index
    @desires = Desire.all
  end

  # GET /desires/1
  # GET /desires/1.json
  def show
  end

  # GET /desires/new
  def new
    @desire = Desire.new
  end

  # GET /desires/1/edit
  def edit
  end

  # POST /desires
  # POST /desires.json
  def create
    @desire = Desire.new(desire_params)
    @desire.save!
  end

  # PATCH/PUT /desires/1
  # PATCH/PUT /desires/1.json
  def update
    respond_to do |format|
      if @desire.update(desire_params)
        format.html { redirect_to @desire, notice: 'Desire was successfully updated.' }
        format.json { render :show, status: :ok, location: @desire }
      else
        format.html { render :edit }
        format.json { render json: @desire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desires/1
  # DELETE /desires/1.json
  def destroy
    @desire.destroy
    respond_to do |format|
      format.html { redirect_to desires_url, notice: 'Desire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_desire
      @desire = Desire.find(params[:id])
    end


    def desire_params
      params.permit(:user_id, :product_id)
    end
end

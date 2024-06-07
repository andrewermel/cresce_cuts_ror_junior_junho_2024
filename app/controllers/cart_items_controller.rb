class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[show edit update destroy]

  def index
    @cart_items = CartItem.all
  end

  def show; end

  def new
    @cart_item = CartItem.new
  end

  def edit; end

  def create
    @cart_item = CartItem.new(cart_item_params)
    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to @cart_item, notice: "Cart item was successfully created." }
        format.json { render :show, status: :created, location: @cart_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: "Cart item was successfully updated." }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_items_url, notice: "Cart item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :item_id, :quantity)
  end
end

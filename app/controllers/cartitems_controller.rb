class CartitemsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @cart_item = CartItem.new
  end

  def create
    cart_item = CartItem.new(
      qty: params[:cart_item][:qty],
      product_id: params[:cart_item][:product_id]
    )

    cart_item.cart = current_cart
    cart_item.save

    redirect_to cart_path(current_cart)
  end

  def destroy
    cart_item = current_cart.cart_items.find(params[:id])
    cart_item.destroy

    redirect_to cart_path(current_cart)
  end
end
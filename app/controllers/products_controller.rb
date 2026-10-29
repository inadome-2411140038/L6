class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(
      name: params[:product][:name],
      price: params[:product][:price]
    )

    product.save
    redirect_to products_path
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy

    redirect_to products_path
  end
end
class Admin::ProductsController < ApplicationController

  def index
    @product = Product.all
  end

  def new
    @product=Product.new
  end

  def create
    debugger
    @product=Product.new(product_params)
    if @product.save
      redirect_to admin_products_url
    end
  end

  def show
    @product=Product.find(params[:id])
  end

  def edit
    @product=Product.find(params[:id])
  end

  def update
    @product=Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_url
    end
  end

  def destroy
    @product=Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_url
  end
  
  private
  def product_params
    params.expect(product: [ :name, :company, :version, :price, :storage ])
  end
end

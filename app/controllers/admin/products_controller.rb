class Admin::ProductsController < ApplicationController
layout "admin"
before_action :authenticate_user!
before_action :admin_required

   def index
     @products = Product.all
   end


  def new
     @product = Product.new
   end

   def create
     @product = Product.new(product_params)

     if @product.save
       redirect_to admin_products_path
     else
       render :new
     end
   end

  def edit
    @product = Product.find_by_friendly_id!(params[:id])
  end

  def update
    @product = Product.find_by_friendly_id!(params[:id])

   if @product.update(product_params)
     redirect_to admin_products_path, notice:'Update Success'
   else
     render :edit
   end
 end

   private

   def product_params
     params.require(:product).permit(:title, :description, :quantity, :price, :image)
   end
 end

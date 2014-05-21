class StoreController < ApplicationController
  def index
    @products=Product.find_product_for_sale

    @time=Time.new
  end

  def empty_cart
    session[:cart]=nil
    redirect_to_index('Your cart is currently empty')
  end

  def add_to_cart
    product=Product.find(params[:id])
    @cart=find_cart
    @cart.add_product(product)
  rescue ActiveRecord::RecordNotFound
    logger.error ("Attepmt to access invalid product #{[params{:id}]}")
    redirect_to_index("Invalid product")
  end

  def redirect_to_index(msg)
    flash[:notice]=msg
    redirect_to :action => 'index'
  end

  private
  def find_cart
=begin
    unless session[:cart]
      session[:cart]=Cart.new
    end
    session[:cart]
=end
    session[:cart] ||= Cart.new
  end

end

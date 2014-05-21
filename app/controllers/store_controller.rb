class StoreController < ApplicationController
  def index
    @products=Product.find_product_for_sale

    @time=Time.new
  end

end

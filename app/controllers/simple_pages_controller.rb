class SimplePagesController < ApplicationController
  def index
    @products = Product.limit(3)
  end
end

class SimplePagesController < ApplicationController
  def landing_page

    @products = Product.limit(3)
  end
end

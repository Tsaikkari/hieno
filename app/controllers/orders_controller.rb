class OrdersController < ApplicationController

  def index
    if current_user.admin
      @orders = Order.includes(:product).all
    else
      @orders = Order.where(user_id: current_user).includes(:product)
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
    @order = Order.new(order_params)
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to "/simple_pages/landing_page", notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: "/simple_pages/landing_page" }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end
  before_action :authenticate_user!
end

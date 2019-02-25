class OrdersController < ApplicationController
  def index
    @orders = Order.includes(:product).all
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

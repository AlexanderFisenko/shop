class OrdersController < ApplicationController

  def create
    @order = Order.create(params[:order])
    if @order.valid?
      session[:items_in_cart].each do |key, value|
        @order.order_items.create(item_id: key, quantity: value[:quantity])
      end

      OrderMailer.notify_admin(@order).deliver
      OrderMailer.notify_user(@order).deliver

      session[:items_in_cart] = {}
      redirect_to @order
    else
      render "new"
    end
  end

  def show
    @order = Order.where(token: params[:id]).first
  end

  def new
    @items = Item.where(id: session[:items_in_cart].keys)
    @order = Order.new
  end

end

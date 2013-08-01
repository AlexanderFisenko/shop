class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  def add_to_cart
    @item = Item.find(params[:id])
    unless session[:items_in_cart]
      session[:items_in_cart] = {}
    end

    if session[:items_in_cart][@item.id]
      session[:items_in_cart][@item.id][:quantity] = session[:items_in_cart][@item.id][:quantity].to_i + 1
    else
      session[:items_in_cart][@item.id] = { quantity: 1 }
    end
    redirect_to cart_path#, notice: "Товар #{@item.name} был добавлен в Корзину"
  end

  def update_in_cart
    session[:items_in_cart][params[:id].to_i][:quantity] = params[:quantity]
    redirect_to cart_path
  end

  def remove_from_cart
    session[:items_in_cart].delete(params[:id].to_i)
    redirect_to cart_path
  end

  def temp
  end


end

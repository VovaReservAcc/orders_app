class OrdersController < ApplicationController
    ActionView::Base.include(ApplicationHelper)
    def index
       @all_orders = Order.all
    end   
    def show
      @order = Order.find(params[:id])
    end
    
    def edit
      @order = Order.find(params[:id])
      @goods_collection_for_select = Good.all.each_with_object([]){|g,o| o << [g.name, g.id]}
      @customer_collection_for_select =  Customer.all.each_with_object([]){|g,o| o << [g.name, g.id]}
    end   
    
    def update
    end    
    
    def new
        @order = Order.new
       @goods_collection_for_select = Good.all.each_with_object([]){|g,o| o << [g.name, g.id]}
       @customer_collection_for_select =  Customer.all.each_with_object([]){|g,o| o << [g.name, g.id]}
       # @order_lines = o
    end    
    
    
    def create
     @order = Order.new(good_params)
     respond_to do |format|
      if @order.save
        format.html { redirect_to goods_path, notice: 'Order was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
    end   
    
    def good_params
      params.require(:order).permit(:customer_id, :number, :date, )
    end
end

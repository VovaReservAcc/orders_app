class OrdersController < ApplicationController
    ActionView::Base.include(ApplicationHelper)
    
    before_action :load_data
    
    def index
       @all_orders = Order.all
    end   
    
    def show
    end
    
    def edit
    end   
    
    def update
      if current_order.update order_params
        redirect_to orders_path
      else
        render :edit
      end
    end    
    
    def new
      @current_order = Order.new
    end    
    
    
    def create
     @current_order = Order.new(order_params)
     respond_to do |format|
      if @current_order.save
        format.html { redirect_to orders_path, notice: 'Order was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
    end   
    
    
     
    protected
    
    helper_method def current_order
      @current_order ||= Order.find(params[:id])
    end
    
    private
    
    def load_data
      @goods_collection_for_select = Good.all.each_with_object([]){|g,o| o << [g.name, g.id]}
      @customer_collection_for_select =  Customer.all
    end  
    
    def order_params
      params.require(:order).permit(:customer_id, :number, :date, order_rows_attributes: [:id, :good_id, :count, :price, :_destroy])
    end
end

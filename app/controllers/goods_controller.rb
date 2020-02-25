class GoodsController < ApplicationController
    def index
       @all_goods = Good.all
    end   
    def show
    
    end
    
    def edit
    end    
    
    def new
        @good = Good.new
    end    
    
    
    def create
     @good = Good.new(good_params)
     respond_to do |format|
      if @good.save
        format.html { redirect_to goods_path, notice: 'Good was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
    end   
    
    def good_params
      params.require(:good).permit(:name, :properties, :count_in_pack)
    end
end

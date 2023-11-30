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
    
    def update
      if current_good.update good_params
        redirect_to goods_path
      else
        render :edit
      end
    end
    
    def create
     @good = Good.new(good_params)
     respond_to do |format|
      if @good.save
        format.html { redirect_to goods_path, notice: 'Item was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
     end
    end  
    
    def destroy
    current_good.destroy

      respond_to do |format|
        format.html { redirect_to goods_url, notice: 'Item was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    
    protected
    
    helper_method def current_good
      @good ||= Good.find(params[:id])
    end
    
    private
    
    def good_params
      params.require(:good).permit(:name, :properties, :count_in_pack)
    end
end

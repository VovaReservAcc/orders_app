class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_rows
    before_save :set_date
    validates_presence_of :order_rows, :customer_id, :number 
    
    accepts_nested_attributes_for :order_rows, allow_destroy: true
    
    def set_date
      self.date = Time.current
    end    
end
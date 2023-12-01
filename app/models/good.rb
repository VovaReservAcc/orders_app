class Good < ApplicationRecord
    validates :name, presence: true
    has_many :order_rows
 end

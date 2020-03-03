class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_rows
    accepts_nested_attributes_for :order_rows, allow_destroy: true
end
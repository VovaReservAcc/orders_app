class Customer < ApplicationRecord
    attr_accessor :user, :properties, :prefix
    has_many :orders
end
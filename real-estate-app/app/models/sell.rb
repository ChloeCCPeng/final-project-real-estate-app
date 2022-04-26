class Sell < ApplicationRecord 
    belongs_to :seller, class_name: 'User'
    belongs_to :browser, class_name: 'User'
end

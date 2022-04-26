class User < ApplicationRecord
    has_many :watchlists
    has_many :houses, through: :watchlists
    has_many :messages
    has_many :offers

    # self relational join
    has_many :seller_users, foreign_keys: :seller_id, class_name: 'Sell'
    has_many :browsers, through: :seller_users

    has_many :browsing_users, foreign_keys: :browser_id, class_name: 'Sell'
    has_many :sellers, through: :browsing_users
end

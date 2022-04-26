class User < ApplicationRecord
    has_many :watchlists
    has_many :houses, through: :watchlists
    has_many :messages
    has_many :offers
end

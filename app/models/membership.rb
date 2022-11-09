class Membership < ApplicationRecord
    belongs_to :gym 
    belongs_to :client
    validates :gym, uniqueness: true
end

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional:true
  belongs_to :favorite, optional:true
end

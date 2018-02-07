class Article < ActiveRecord::Base
  validates :title, presence: true, length:{ minimum: 3, maximum: 50 }
  validates :description, presence: true, length:{ minimum: 3, maximum: 300 }
  validates :post, presence: true, length:{ minimum: 3, maximum: 2000 }
end

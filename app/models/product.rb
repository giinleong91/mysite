class Product < ActiveRecord::Base
  scope :search_name, -> (argument) {where("name LIKE ?", "%#{argument}%")}
end

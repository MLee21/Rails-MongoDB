class Product
  include Mongoid::Document
  field :name, type: String
  field :price, type: Integer
end

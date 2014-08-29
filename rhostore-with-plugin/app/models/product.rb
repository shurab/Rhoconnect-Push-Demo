class Product < ActiveRecord::Base
  attr_accessible :brand, :name, :price, :quantity, :sku

  # plugin:
  include Rhoconnectrb::Resource

  def partition
    lambda { 'push' }
    # :app
  end

  def self.rhoconnect_query(partition, attributes = nil)
    Product.all
  end

end

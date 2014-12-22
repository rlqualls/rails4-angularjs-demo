class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :price, :presence => true,
            :numericality => true,
            :format => { :with => /\A\d{1,7}(\.\d{0,2})?\Z/ }

  has_many :comments
  accepts_nested_attributes_for :comments, allow_destroy: true
end

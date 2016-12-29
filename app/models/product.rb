class Product < ActiveRecord::Base
  belongs_to :provider
  belongs_to :user
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :photos, as: :photoable, dependent: :destroy
  accepts_nested_attributes_for :photos  
end

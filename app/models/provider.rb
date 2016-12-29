class Provider < ActiveRecord::Base
  has_many :product
  has_many :user
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  accepts_nested_attributes_for :user  

  has_many :photos, as: :photoable, dependent: :destroy
  accepts_nested_attributes_for :photos  
  
  validates_presence_of :company_name, :message => "不能为空"
  validates_presence_of :category, :message => "不能为空"
  validates_presence_of :area, :message => "不能为空"
  validates_presence_of :address, :message => "不能为空"
  validates_presence_of :contact_name, :message => "不能为空"
  validates_presence_of :contact_title, :message => "不能为空"
  validates_presence_of :mobile, :message => "不能为空"
  validates_presence_of :telephone, :message => "不能为空"
  validates_presence_of :fax, :message => "不能为空"

end

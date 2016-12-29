class User < ActiveRecord::Base
  validates :username, :password, 
             presence: {message: '供应商分配帐号密码不能为空'},
             on: :create
  has_secure_password validations: false
  belongs_to :provider
  has_many :product

end

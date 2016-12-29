class MainController < ApplicationController
  skip_before_filter :authorize

  def index
    # big number to small number
    @products = Product.order("created_at DESC")
  end
  
  def NewProduct
  end
  def OldProduct
  end
  def Parners
  end
  def AboutE
  end
  def Tender
  end
  def NewProvider
      @providers = Provider.order("created_at DESC")
      @provider = Provider.new
      @provider.photos.build(tag: :license)
      @provider.photos.build(tag: :company)
  end
end

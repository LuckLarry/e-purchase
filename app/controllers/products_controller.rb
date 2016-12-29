class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]

  def products_list
    provider_form_user = User.find(session[:user_id]).provider_id
    if params[:search]
      @products = Product.order("updated_at DESC")
      .where(:provider_id => provider_form_user)
      .where(['name LIKE ?', "%#{params[:search]}%"])
      .where(['category LIKE ?',  "%#{params[:category]}%"])
      .where(['product_status LIKE ?', "%#{params[:product_status]}%"])
      .all.paginate page: params[:page], per_page: 12
    else
      @products = Product.where(:provider_id => provider_form_user)
	.order("updated_at DESC").paginate page: params[:page], per_page: 12
    end
  end

# GET /products
# GET /products.json
  def index
    if params[:start_date] || params[:end_date]
    start_date = Date.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
    end_date = Date.civil(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i)
    end
    if params[:search] || params[:status] || params[:roles] || params[:company_name] ||params[:start_date] || params[:end_date]
      @products = Product.all
      .joins(:provider)
      .order("updated_at DESC")
      .where(['name LIKE ?', "%#{params[:search]}%"])
      .where(['products.status LIKE ?', "%#{params[:status]}%"])
      .where(['company_name LIKE ?', "%#{params[:company_name]}%"])
      .where("products.updated_at >= :start_date AND products.updated_at <= :end_date",{start_date: start_date, end_date: end_date})
      .paginate page: params[:page], per_page: 12
    else
      @products = Product.order("updated_at DESC").paginate page: params[:page], per_page: 12
    end 
  end

# GET /products/1
# GET /products/1.json
  def show
    @products = Product.order("updated_at DESC")
  end

# GET /products/new
  def new
    @provider_id = User.find(session[:user_id]).provider_id
    @product = Product.new
    @product.photos.build(tag: :Product_A)
    @product.photos.build(tag: :Product_B)
    @product.photos.build(tag: :Product_C)
    @product.photos.build(tag: :Product_D)
    @product.photos.build(tag: :Product_E)
  end

# GET /products/1/edit
  def edit
  end

# POST /products
# POST /products.json
  def create
    @product = Product.new(product_params)
    @product.provider = current_user.provider
    respond_to do |format|
      if @product.save
	format.html { redirect_to @product, notice: '您已成功提交商品，我们会在1~2个工作日受理您的申请，请耐心等待，如有问题请联系客服0757-82581702。' }
	format.json { render :show, status: :created, location: @product }
      else
	format.html { render :new }
	format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

# PATCH/PUT /products/1
# PATCH/PUT /products/1.json
  def update
    if params[:product][:photos_attributes][:'0'] != nil
      @photo = Photo.find(params[:product][:photos_attributes][:'0'][:id])
      @photo.update(image: params[:product][:photos_attributes][:'0'][:image])
    end
    if params[:product][:photos_attributes][:'1'] != nil
      @photo = Photo.find(params[:product][:photos_attributes][:'1'][:id])
      @photo.update(image: params[:product][:photos_attributes][:'1'][:image])
    end
    if params[:product][:photos_attributes][:'2'] != nil
      @photo = Photo.find(params[:product][:photos_attributes][:'2'][:id])
      @photo.update(image: params[:product][:photos_attributes][:'2'][:image])
    end
    if params[:product][:photos_attributes][:'3'] != nil
      @photo = Photo.find(params[:product][:photos_attributes][:'3'][:id])
      @photo.update(image: params[:product][:photos_attributes][:'3'][:image])
    end
    if params[:product][:photos_attributes][:'4'] != nil
      @photo = Photo.find(params[:product][:photos_attributes][:'4'][:id])
      @photo.update(image: params[:product][:photos_attributes][:'4'][:image])
    end

    respond_to do |format|
      if @product.update(product_update_params)
	format.html { redirect_to products_url, notice: '产品已审核成功' }
	format.json { render :show, status: :ok, location: @product }
      else
	format.html { render :edit }
	format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

# DELETE /products/1
# DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

# Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

# Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).
permit(:provider_id, :category, :status, :product_status, :name, :number, :unit, :price, :start_volume, :volume, :brand, :spec, :other, :mark, photos_attributes: [:image, :tag])
    end
    def product_update_params
	  params.require(:product).
permit(:provider_id, :category, :status, :product_status, :name, :number, :unit, :price, :start_volume, :volume, :brand, :spec, :other, :mark, )
    end
  end

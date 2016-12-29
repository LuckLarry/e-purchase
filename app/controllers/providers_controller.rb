class ProvidersController < ApplicationController
  skip_before_filter :authorize, only: [:show, :new, :create]
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  # GET /providers
  # GET /providers.json
  def index
    if params[:search] || params[:status]
      @providers = Provider.all
                 .order("updated_at DESC")
                 .where(['company_name LIKE ?', "%#{params[:search]}%"])
                 .where(['status LIKE ?',  "%#{params[:status]}%"])
                 .paginate page: params[:page], per_page: 10
		
    else
      @providers = Provider.order("updated_at DESC").paginate page: params[:page], per_page: 10
    end
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
  end

  def company_information
    @provider = Provider.find(User.find(session[:user_id]).provider_id)
  end
  # GET /providers/new
  def new
    @providers = Provider.order("created_at DESC").take(5)
    @provider = Provider.new
    @provider.photos.build(tag: :license)
    @provider.photos.build(tag: :company)
  end

  # GET /providers/1/edit
  def edit 

  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)
    respond_to do |format|
      if @provider.save
        format.html { redirect_to @provider, notice: '您已成功提交入驻申请，我们会在1~2个工作日受理您的申请，请耐心等待，如有问题请联系客服0757-82581702。' }
        format.json { render :show, status: :created, location: @provider }
      else
        @providers = Provider.order("created_at DESC").take(5)
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update 
    if User.find_by_provider_id(params[:id]) !=nil and  params[:commit]=='重置密码'
      username = User.find_by_provider_id(params[:id]).username
      @user = User.find_by_username(username)
      respond_to do |format|
	@user.update(password: "123456")
	@provider.update(user_id: User.last.id)
        format.html { redirect_to providers_url, notice: '重置成功' }
      end
    else
      if params[:provider][:photos_attributes][:'0'] !=nil and params[:provider][:photos_attributes][:'3'] !=nil
	if params[:provider][:photos_attributes][:'0'][:image] != nil
	  @photo = Photo.find(params[:provider][:photos_attributes][:'0'][:id])
	  @photo.update(image: params[:provider][:photos_attributes][:'0'][:image])
	end
	if params[:provider][:photos_attributes][:'3'][:image] !=nil
	  @photo = Photo.find(params[:provider][:photos_attributes][:'3'][:id])
	  @photo.update(image: params[:provider][:photos_attributes][:'3'][:image])
	end
      else
	if params[:provider][:photos_attributes][:'1'][:image] !=nil
	  @photo = Photo.find(params[:provider][:photos_attributes][:'1'][:id])
	  @photo.update(image: params[:provider][:photos_attributes][:'1'][:image])
	end
	if params[:provider][:photos_attributes][:'2'][:image] !=nil
	  @photo = Photo.find(params[:provider][:photos_attributes][:'2'][:id])
	  @photo.update(image: params[:provider][:photos_attributes][:'2'][:image])
	end
      end
      respond_to do |format|
        if @provider.update(provider_update_params)
          @provider.update(user_id: User.last.id)
          format.html { redirect_to providers_url, notice: '保存成功' }
          format.json { render :show, status: :ok, location: @provider }
        else
          format.html { render :edit }
          format.json { render json: @provider.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'Provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:company_name, :category, :area, :address, :contact_name, :contact_title, :mobile, :telephone, :fax, :qq, :company_information, :status, photos_attributes: [:image, :tag], user_attributes:[:username, :password])
    end
    def provider_update_params
      params.require(:provider).permit(:company_name, :category, :area, :address, :contact_name, :contact_title, :mobile, :telephone, :fax, :qq, :company_information, :status, user_attributes:[:username, :password])
    end
end

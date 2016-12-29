Rails.application.routes.draw do
  root to: 'main#index'
  get 'company_information', to: 'providers#company_information'
  get 'UpdatePassword', to: 'providers#UpdatePassword'
  get 'products_list', to: 'products#products_list'
  get 'products_new', to: 'products#new'
  get 'NewProduct', to: 'main#NewProduct'
  get 'NewProvider', to: 'main#NewProvider'
  get 'Tender', to: 'main#Tender'
  get 'OldProduct', to: 'main#OldProduct'
  get 'Parners', to: 'main#Parners'
  get 'AboutE', to: 'main#AboutE'
  controller :sessions do
    post 'UpdatePassword'  =>:update
    get    'login'  => :new
    post   'login'  => :create
    delete 'logout' => :destroy
  end
 #resources :sessions
  resources :products
  resources :providers
  resources :users
end

Rails.application.routes.draw do
  get '/' => 'home#top'
  get '/collection' => 'home#collection'

  resources :work, only: [:new, :index, :edit, :create, :destroy, :update]
  post 'login' => 'admin#sign_in'
  post 'logout' => 'admin#sign_out'
  get 'login' => 'admin_form'
  post '/ja' => 'home#to_ja'
  post '/en' => 'home#to_en'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Webtopia::Application.routes.draw do

  resources :users
  resources :contents
  resources :pages

  resource :session


#Administrative pages
  get "sitemap.xml" => "pages#sitemap_page"

#Registration and login
  get "register_new_user" => "users#new"
  get "/login" => "pages#login_page"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"





  #dynamic page routing routes
  get "/:page_name" => "pages#section_sub_page"
  get "/:section1/:page_name" => "pages#section_sub_page"
  get "/:section1/:section2/:page_name" => "pages#section_sub_page"
  get "/:section1/:section2/:section3/:page_name" => "pages#section_sub_page"
  get "/:section1/:section2/:section3/:section4/:page_name" => "pages#section_sub_page"


end

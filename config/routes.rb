Webtopia::Application.routes.draw do

  resources :lists

  resources :blogs

  resources :website_settings

  resources :users
  resources :contents
  resources :pages

  resource :session


#default route redirects to default page set in website config
  root :to => "pages#home_page"


#Administrative pages
  get "sitemap.xml" => "pages#sitemap_page"
  get "rss.xml" => "pages#rss_page"

#Registration and login
  get "register_new_user" => "users#new"
  get "/login" => "pages#login_page"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"




  #find blog
  get "/blog/:id/:name" => "pages#get_blog"

  #dynamic page routing routes
  get "/:page_name" => "pages#section_sub_page"
  get "/:section1/:page_name" => "pages#section_sub_page"
  get "/:section1/:section2/:page_name" => "pages#section_sub_page"
  get "/:section1/:section2/:section3/:page_name" => "pages#section_sub_page"
  get "/:section1/:section2/:section3/:section4/:page_name" => "pages#section_sub_page"


end

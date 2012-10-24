Webtopia::Application.routes.draw do

  resources :contents

  resources :pages


  #dynamic page routing routes
  get "/:page_name" => "pages#section_sub_page"
  get "/:section1/:page_name" => "pages#section_sub_page"
  get "/:section1/:section2/:page_name" => "pages#section_sub_page"
  get "/:section1/:section2/:section3/:page_name" => "pages#section_sub_page"
  get "/:section1/:section2/:section3/:section4/:page_name" => "pages#section_sub_page"


end

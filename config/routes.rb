Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  resources :categories, only: [:show]
  resources :pages, only: [:show]

  namespace :admin do
  resources :types, except: [:show]
  resources :pages
  resources :categories
  resources :menus, except: [:show]
  end
  root 'admin/pages#index'
  Page.where.not("slug", nil).all.each do |page|
  	get "/#{page.slug}", controller: "pages" , action: "show", id: page.id
  end
  
end

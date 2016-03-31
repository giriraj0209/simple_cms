Rails.application.routes.draw do
  get 'menus/index'

  get 'menus/new'

  get 'menus/create'

  get 'menus/update'

  get 'menus/edit'

  get 'menus/destroy'

  mount Ckeditor::Engine => '/ckeditor'
  resources :categories, only: [:show]
  resources :pages, only: [:show]

  namespace :admin do
  resources :pages
  resources :categories
  end
  root 'admin/pages#index'
  Page.where.not("slug", nil).all.each do |page|
  	get "/#{page.slug}", controller: "pages" , action: "show", id: page.id
  end
  
end

Rails.application.routes.draw do
  resources :categories
  resources :pages, only: [:show]
  namespace :admin do
  resources :pages
  end

  Page.where.not("slug", nil).all.each do |page|
  	get "/#{page.slug}", controller: "pages" , action: "show", id: page.id
  end
  root 'admin/pages#index'
end

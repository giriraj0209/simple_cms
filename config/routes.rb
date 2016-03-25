Rails.application.routes.draw do
  resources :pages, only: [:show]
  namespace :admin do
  resources :pages
  end

  Page.where.not("slug", nil).all.each do |page|
  	get "/#{page.slug}", controller: "pages" , action: "show", id: page.id
  end
end

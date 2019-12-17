Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # set root to articles index
  root to: 'articles#index'

  resources :articles do
    resources :comments #specifies comments as subresource
  end
end

# Blogger::Application.routes.draw do
#   resources :articles
# end
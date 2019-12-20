Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # set root to articles index
  root 'articles#index'
  
  # tags to: 'tags#index'

  resources :authors


  
  resources :articles do
    resources :comments #specifies comments as subresource
  end
  resources :tags
    # author sessions: login and logout
    resources :author_sessions, only: [ :new, :create, :destroy ]
    get 'login'  => 'author_sessions#new'
    get 'logout' => 'author_sessions#destroy'
end

# Blogger::Application.routes.draw do
#   resources :articles
# end
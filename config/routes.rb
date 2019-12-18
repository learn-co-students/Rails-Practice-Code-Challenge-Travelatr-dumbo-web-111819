Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:show, :index, :new, :create]
  resources :destinations, only: :show
  resources :posts, only: [:show, :new, :create, :edit, :update]

  put 'posts/:id/like', :to => 'posts#like', as: 'like_post'

end

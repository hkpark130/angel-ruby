Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'users/signup', to: 'users#signup'
      post 'auth/signin', to: 'auth#signin'
      get 'content', to: 'contents#get'
      post 'contents', to: 'contents#post'
      delete 'contents/:id', to: 'contents#delete'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

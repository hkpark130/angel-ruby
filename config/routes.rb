Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'users/signup', to: 'users#signup'
      post 'auth/signin', to: 'auth#signin'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

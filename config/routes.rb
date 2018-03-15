Rails.application.routes.draw do

 get "/users" => "welcome#index"


  resources :stories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
devise_for :users, :controllers => { :registrations => 'users/registrations' }
devise_scope :user do
  authenticated :user do
    root :to => 'welcome#index'
  end
  unauthenticated :user do
    root :to => 'devise/registrations#new', as: :unauthenticated_root
  end
end

get "/users/:id" => "welcome#show"

end



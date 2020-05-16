Rails.application.routes.draw do
   
  post 'likes/:post_id/create',   to: 'likes#create'
  post "likes/:post_id/destroy" => "likes#destroy"

  get  '/signup',  to: 'users#new'
  post  '/signup',  to: 'users#create'
  get  "posts/:id/edit" => "posts#edit"
  post 'users/:id' => 'users#update'
  post "users/:id/destroy" => "users#destroy"
  resources :users  
  get '/test/login', to:'login#test_login_form'
  get '/login', to: 'login#login_form'
  post '/login', to: 'login#login'
  delete "/logout", to: "login#logout"
  
  get "users/:id/likes" => "users#likes"
  
  get '/new', to: 'posts#new'
  post 'posts/:id' => 'posts#update'
  post "posts/:id/destroy" => "posts#destroy"
  resources :posts
  
  root 'home#top'
  get  '/about',   to: 'home#about'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

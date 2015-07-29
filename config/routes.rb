Rails.application.routes.draw do

  post '/login' => 'auth#login'
  post '/register' => 'auth#register'
  delete '/logout' => 'auth#logout'


  resources :lines, except: [:new, :edit] do

    resources :comments, except: [:new, :edit]

    #resources :users, except: [:new, :edit]
  end
end


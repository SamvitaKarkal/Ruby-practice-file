Rails.application.routes.draw do

  root 'demo#index'

  get 'admin', :to => 'access#menu'   #if they are logged in, they'll get the menu page they wanted, else they get the login form.
  get 'access/menu'
  get 'access/login'    #can treat as resourceful route or simple controller

  post 'access/attempt_login'
  get 'access/logout'

  resources :posts
  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end

  # get 'pages/index'
  # get 'pages/show'
  # get 'pages/new'
  # get 'pages/edit'
  # get 'pages/delete'
  
  # get 'subjects/index'
  # get 'subjects/show'
  # get 'subjects/new'
  # get 'subjects/edit'
  # get 'subjects/delete'
  # get 'self_contr/home'

  #root "demo#index"
  get 'demo/index'        #simple route
  #get 'demo/hello'  # get ':controller(/:action(/:id))'  #default route
  #get 'demo/about'
  #get 'demo/contact'
end

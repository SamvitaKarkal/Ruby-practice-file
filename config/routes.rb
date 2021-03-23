Rails.application.routes.draw do

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

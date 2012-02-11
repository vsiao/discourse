Chatter::Application.routes.draw do

  root :to => 'static#home'
  
  resources :channels

  resources :messages
  
  ##################### Omniauth ########################
  match '/auth/:provider/callback' => 'authentications#create'
  delete '/logout' => 'authentications#destroy'
  #######################################################
  
end

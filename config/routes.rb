Chatter::Application.routes.draw do

  resources :channels
  resources :messages
  root :to => 'static#home'
  
  ##################### Omniauth ########################
  match '/auth/:provider/callback' => 'authentications#create'
  delete '/logout' => 'authentications#destroy'
  #######################################################

end

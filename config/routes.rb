Chatter::Application.routes.draw do

  resources :channels
  resources :messages
  resources :chats
  root :to => 'static#home'
  
  ##################### Omniauth ########################
  match '/auth/:provider/callback' => 'authentications#create'
  delete '/logout' => 'authentications#destroy'
  #######################################################
  
  match "/channels-user-active" => "channels#user_active"
  match "/channels-user-inactive" => "channels#user_inactive"

end

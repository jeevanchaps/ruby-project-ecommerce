Rails.application.routes.draw do
  root to: redirect('/home', status: 302)
  get 'home', to: 'g_rabit#home', as: 'home'
  get 'messages', to: 'messages#messages', as: 'messages'
  get 'messages/:id', to: 'messages#message_board', as: 'message_board'
  post 'messages/:id', to: 'messages#send_message'
  devise_for :users
  get 'user_profile',to: 'g_rabit#user_profile', as: 'user_profile'
  get 'users', to: 'g_rabit#index', as: 'users' #list all users
  get 'users/:id',to:'g_rabit#deactivate', as:'deactivate' #Deactivated

  

  #routes for item model
  get 'items', to:'items#index', as:'items' #index
  get 'items/new', to: 'items#new', as: 'new_item' # new
  post 'items', to: 'items#create' # create
  get 'items/:id/edit', to: 'items#edit', as: 'edit_item' # edit
  patch 'items/:id', to: 'items#update' # update (as needed)
  put 'items/:id', to: 'items#update' # update (full replacement)
  get 'items/:id', to:'items#show', as:'item' #show
  delete 'items/:id', to: 'items#destroy' # destroy
  post 'items/:id',to:'items#reported' #reported

  get 'items/search_results/:id', to: 'items#search', as: 'search'
  get 'items/category_results/:id', to: 'items#search_by_category', as: 'category'

  #routes for Admin
  get 'administrator', to:'administrator#index', as:'admin' #index
  get 'reports', to:'administrator#view', as:'reports' #view
  get 'deactivated_users', to: 'administrator#userindex', as: 'deactivated_users' #list all deactivated users
  get 'deactivated_users/:id', to: 'administrator#reactivate', as: 'reactivate_users' #reactivate users
  get 'administrator/:id', to:'administrator#show', as:'admin_item' #show
  delete 'administrator/:id', to: 'administrator#destroy' # destroy
  
end

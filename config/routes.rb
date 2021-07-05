Rails.application.routes.draw do

  resources :items, only: [:index, :new, :create, :show, :edit, :update]

 
  get 'items/index'
  #rails g contorller items indexででてくる
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  #TOPページを表示させる。
  #activehachのルーティング

end

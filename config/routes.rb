Rails.application.routes.draw do
  resources :homes
  resources :books#, except: [:new, :index, :show, :edit]
  #get 'books/new'
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  post 'books' => 'books#create'
end

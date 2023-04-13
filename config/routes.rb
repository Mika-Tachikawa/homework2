Rails.application.routes.draw do
  #/でトップページを表示できるようにする
  root 'homes#top'
  resources :homes
  resources :books
  #get 'books/new'
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get 'top' => 'homes#top'
  #試し　post 'books' => 'books#create'
  #試し　get 'books' => 'books#index'
  #as: 'book'にすると、コントローラーのcreateのredirectで、他の設定と干渉するため、
  #'booka'に設定
  #試し　get 'books/:id' => 'books#show', as: 'booka'
  #as: 'edit_book'にすると、他の設定と干渉するため、'edit_bookb'に設定
  #試し　get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  #試し　patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end

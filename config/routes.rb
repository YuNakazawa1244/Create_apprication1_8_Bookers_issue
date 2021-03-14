Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  root to: 'homes#top'
  # get '/', to: 'homes#top'

  post 'books', to: 'books#create'

end

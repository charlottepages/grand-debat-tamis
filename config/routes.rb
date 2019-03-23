Rails.application.routes.draw do
  root 'demo#search'
  get 'demo/search'
  get 'demo/show'
  get 'demo/list'
  get 'demo/engage'
  get 'demo/reindex'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :answers
  resources :questions
end

Rails.application.routes.draw do
  root 'companies#index'

  resources :companies do
    resources :founders
  end

  resources :tags
end

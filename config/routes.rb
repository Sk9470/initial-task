Rails.application.routes.draw do
  resources :job_seekers
  use_doorkeeper
  devise_for :users
  resources :recruiters, only: %i[index show destroy update] do
    post :sign_up, on: :collection
  end
  resources :job_seekers, only: %i[index show destroy update] do
    post :sign_up, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

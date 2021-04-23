Rails.application.routes.draw do
  resources :diaries, only: [:index, :show, :new, :edit, :create, :destroy]
end
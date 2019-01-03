Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  get 'calendar', to: 'calendar#show_calendar', as: 'calendar'
  resources :working_time_records, only: [:create, :index, :destroy, :update] do
    collection do
      post 'start'
      post 'end'
    end
  end

  resources :categories, only: [:create, :index, :destroy, :update] do
  end
end

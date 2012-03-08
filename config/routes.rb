FinishWeekend::Application.routes.draw do
  resources :registrations, only: [:new, :create]

  root to: "events#index"
end

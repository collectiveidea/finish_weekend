FinishWeekend::Application.routes.draw do
  resources :events, only: :show do
    resources :registrations, only: [:new, :create]
  end

  root to: "events#index"
end

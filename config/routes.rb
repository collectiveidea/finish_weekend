FinishWeekend::Application.routes.draw do
  
  get "/faq", :to => "home#faq"

  resources :events, only: [:index, :show] do
    resources :registrations, only: [:new, :create]
  end

  root to: "home#index"
end

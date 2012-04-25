FinishWeekend::Application.routes.draw do
  
  get "/faq", :to => "home#faq"

  resources :events, only: [:index, :show] do
    resources :registrations, only: [:new, :create] do
      get :coupon, on: :collection
    end
  end

  resource :sessions, only: [:new, :create, :destroy]

  namespace :manage do
    resources :events do
    end
  end
  root to: "home#index"
end

FinishWeekend::Application.routes.draw do
  
  get "/faq", :to => "home#faq"

  resources :events, only: [:index, :show] do
    resources :registrations, only: [:new, :create] do
      get :coupon, :on => :collection
    end
  end

  scope "/manage" do
    get  "/",              :to => "manage#index"
    get  "/:slug",         :to => "manage#show",    :as => "event_manage"
    put  "/:slug",         :to => "manage#update",  :as => "event_manage" 
    get  "/:slug/coupons", :to => "manage#coupons", :as => "event_coupon"
  end

  root to: "home#index"
end

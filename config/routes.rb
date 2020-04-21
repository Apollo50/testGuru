Rails.application.routes.draw do

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
    end
  end
end

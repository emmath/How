How::Application.routes.draw do
  root to: "topics#index"
  resources :topics do
    resources :steps
  end
end

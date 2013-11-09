Blogger::Application.routes.draw do

  root to:'posts#index'

  resources :posts, :pictures do
    resources :comments
  end

end

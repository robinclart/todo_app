TodoApp::Application.routes.draw do
  resource :session
  get 'projects', to: redirect('/')
  resources :projects do
    resources :todos do
      member do
        patch :complete
      end
    end
  end
  root to: 'projects#index'
end

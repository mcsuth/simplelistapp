TodoApp::Application.routes.draw do
  devise_for :users

  root to: "todos#index"
  resources :todos
end

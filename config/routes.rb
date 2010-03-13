GamingNightSociety::Application.routes.draw do |map|
  devise_for :users
  resources :events
  resources :users, :only => :index
  root :to => "pages#root"
end

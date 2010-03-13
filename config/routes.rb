GamingNightSociety::Application.routes.draw do |map|
  devise_for :users
  resources :events
  root :to => "pages#root"
end

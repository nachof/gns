GamingNightSociety::Application.routes.draw do |map|
  devise_for :users
  resources :events
  map.root :to => "pages#root"
end

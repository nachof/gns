GamingNightSociety::Application.routes.draw do |map|
  devise_for :users

  map.root :controller => :pages, :action => :root
end

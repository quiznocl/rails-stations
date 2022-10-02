Rails.application.routes.draw do
  namespace :admin do
    get 'movies/index'
  end
  get 'movies' => 'movies#index'

  namespace :admin do
    get 'movies' => 'movies#index'
  end
end

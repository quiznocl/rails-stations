Rails.application.routes.draw do
  
  resources :movies, only: [:show, :index] do
    get 'reservation' => 'reservations#index'
    resources :schedules  do
      resources :reservations, only: [:new]
      get 'sheets' => 'sheets#index'
    end
  end

  resources :reservations, only: [:create]

  namespace :admin do
    resources :movies , except: [:show]
    resources :schedules, except: [:show]

    """
    get 'movies' => 'movies#index'
    get 'movies/new' => 'movies#new'
    post 'movies' => 'movies#create'
    #get 'movies/:id' => 'movies#show', as: :post #post_path(1) →　link_to post.content,post_path(post.id)で
    get 'movies/:id/edit' => 'movies#edit', as: :edit_post

    put 'movies/:id' => 'movies#update', as: :update_post




    """
  end
end

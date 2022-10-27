Rails.application.routes.draw do
  get 'sheets' => 'sheets#index'
  resources :movies, only: [:show, :index]

  namespace :admin do
    resources :movies , except: [:show]
    resources :schedules, except: [:show]

    
    get 'movies/:id/schedules/new' => 'schedules#new'

    """
    get 'movies' => 'movies#index'
    get 'movies/new' => 'movies#new'
    post 'movies' => 'movies#create'
    #get 'movies/:id' => 'movies#show', as: :post #post_path(1) →　link_to post.content,post_path(post.id)で
    get 'movies/:id/edit' => 'movies#edit', as: :edit_post

    put 'movies/:id' => 'movies#update', as: :update_post



    put 'movies/:movie_id/schedules/:schedule_id' => 'schedules/:id'
    """
  end
end

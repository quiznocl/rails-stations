Rails.application.routes.draw do
  get 'movies' => 'movies#index'
  get 'sheets' => 'sheets#index'

  namespace :admin do
    resources :movies

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

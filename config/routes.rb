Rails.application.routes.draw do
  constraints(subdomain: 'gites-heidelbeere') do
    root to: 'subdomain_rentings#index', as: :sub_heidelbeere
    get 'simulateur', to: 'subdomain_rentings#simulator', as: :sub_simulateur
  end
  #constraints(subdomain: 'blog') do
  #  root to: 'pages#blog', as: 'blog'
  #end

  scope '(:locale)', locale: /fr|en|de/ do
    root to: 'pages#home'
    get 'about', to: 'pages#about', as: :about
    get 'contact', to: 'pages#contact', as: :contact
    get 'mentions', to: 'pages#mentions', as: :mentions
    get 'alentours', to: 'pages#alentours', as: :alentours
    get 'simulateur', to: 'pages#simulator', as: :simulateur
    post 'result', to: 'pages#result', as: :result
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :holiday_rentings do
      collection do                       # collection => no restaurant id in URL
        get 'gites-heidelbeere'
        get 'meuble-heidelbeere', to: 'holiday_rentings#meuble_heidelbeere', as: :meuble_heidelbeere
        get 'studio-heidelbeere', to: 'holiday_rentings#studio_heidelbeere', as: :studio_heidelbeere
      end
    end

    scope 'ligne-maginot-alsace' do
      get '/', to: 'ligne_maginots#index', as: :ligne_maginots
      get 'four-a-chaux-lembach', to: 'ligne_maginots#four_a_chaux'
      get 'dambach', to: 'ligne_maginots#dambach'
    end

    #scope '/:category' do
    #  resources :articles
    #end
    #resources :articles
    resources :articles
    scope "/(:category)", :defaults => {:category => "/"} do
      resources :articles, only: [:edit, :update, :destroy]
      get '/:category/:slug', to: 'articles#show'
    end

    resources :blog_posts, path: 'blog'
    scope '(:locale)', locale: 'cat' do
    end
    #scope '/:category/:slug' do
    #  resources :articles
    #end
    #scope '/:class' do
    #  resources :various_resources, path: ''
    #end
    #get '/:category/:titre', 'articles#show'

    #get ':category/:titre', to: 'articles#show'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

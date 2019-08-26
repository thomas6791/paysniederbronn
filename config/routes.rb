Rails.application.routes.draw do
  constraints(subdomain: 'gites-heidelbeere') do
    root to: 'subdomain_rentings#index', as: :sub_heidelbeere
    get 'simulateur', to: 'subdomain_rentings#simulator', as: :sub_simulateur
  end
  #constraints(subdomain: 'blog') do
  #  root to: 'pages#blog', as: 'blog'
  #end
  resources :blog_posts, path: '/blog/'
  #get '/fr/blog', :to => redirect('/blog'), :constraints => lambda {|r| !r.original_fullpath.end_with?('/')}

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


    resources :landing_pages, :path => '' do
      collection do
        get '/alimentation', to: 'landing_pages#alimentation'
        get '/chateau-fort-alsace', to: 'landing_pages#chateaux_forts'
        get '/cures-thermales', to: 'landing_pages#cures_thermales'
        get '/ligne-maginot-alsace', to: 'landing_pages#ligne_maginot_alsace'
        get '/randonnees', to: 'landing_pages#randonnees'
        get '/strasbourg', to: 'landing_pages#strasbourg'
      end
    end

    resources :articles, :path => ":category"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

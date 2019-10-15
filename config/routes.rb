Rails.application.routes.draw do
  constraints(subdomain: 'gites-heidelbeere') do
    root to: 'subdomain_rentings#index', as: :sub_heidelbeere
    get 'simulateur', to: 'subdomain_rentings#simulator', as: :sub_simulateur
    get 'appartement', to: 'subdomain_rentings#renting1', as: :grenier
    get 'studio', to: 'subdomain_rentings#renting2', as: :studio
  end
  #constraints(subdomain: 'blog') do
  #  root to: 'pages#blog', as: 'blog'
  #end
  resources :blog_posts, path: '/blog/' do
    collection do
      get "actualites", to: "blog_posts#actualites"
      get "ligne-maginot", to: "blog_posts#ligne_maginot"
      get "thermalisme", to: "blog_posts#thermalisme"
      get "tourisme", to: "blog_posts#tourisme"
    end
  end
  get "/fr/blog/", to: redirect("/blog/")
  get "/fr/blog/:id", to: redirect("/blog/%{id}")
  scope '(:locale)', locale: /fr|en|de/ do
    root to: 'pages#home'
    get 'about', to: 'pages#about', as: :about
    get 'contact', to: 'pages#contact', as: :contact
    get 'mentions', to: 'pages#mentions', as: :mentions
    get 'alentours', to: 'pages#alentours', as: :alentours
    get 'simulateur', to: 'pages#simulator', as: :simulateur

    get 'taxe-invoice', to: 'pages#taxe_invoice'
    get "taxe_invoice", to: redirect("taxe-invoice")

    post 'result', to: 'pages#result', as: :result
    post 'taxe-facture', to: 'pages#result_invoice'
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
        scope :"cures-thermales" do
          get '/station-thermale-niederbronn', to: 'landing_pages#station_niederbronn'
          get 'station-thermale-morsbronn', to: 'landing_pages#station_morsbronn'
        end
        get '/ligne-maginot-alsace', to: 'landing_pages#ligne_maginot_alsace'
        get '/randonnees', to: 'landing_pages#randonnees'
        get '/strasbourg', to: 'landing_pages#strasbourg'
      end
    end

    resources :articles, :path => ":category"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

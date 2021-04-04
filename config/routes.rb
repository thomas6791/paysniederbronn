Rails.application.routes.draw do

  constraints(subdomain: 'heidelbeere') do
    root to: 'subdomain_rentings#index', as: :sub_hunckler
    #get 'simulateur', to: 'subdomain_rentings#simulator', as: :sub_simulateur
    get 'appartement', to: 'subdomain_rentings#renting1', as: :grenier
    get 'studio', to: 'subdomain_rentings#renting2', as: :studio
  end
  constraints(subdomain: 'modenberg') do
    root to: 'subdomain_rentings#index', as: :sub_lindauer
    #get 'simulateur', to: 'subdomain_rentings#simulator', as: :sub_simulateur
    get 'gite', to: 'subdomain_rentings#renting1', as: :gite
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

  #get "/fr/blog/", to: redirect("/blog/")
  #get "/fr/blog/:id", to: redirect("/blog/%{id}")
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    devise_for :users
    devise_scope :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end

    root to: 'pages#home'

    get 'about', to: 'pages#about', as: :about
    get 'contact', to: 'pages#contact', as: :contact
    get 'mentions', to: 'pages#mentions', as: :mentions
    get 'alentours', to: 'pages#alentours', as: :alentours
    get 'simulateur', to: 'pages#simulator', as: :simulateur
    get 'tarifs', to: 'pages#tarifs', as: :tarifs
    get 'cookies', to: 'pages#cookies_infos'
    get 'faq', to: 'pages#faq'
    get 'calendar', to: 'subdomain_rentings#calendar', as: :calendar

    get 'taxe-invoice', to: 'pages#taxe_invoice'
    get "taxe_invoice", to: redirect("taxe-invoice")

    post 'result', to: 'pages#result', as: :result
    post 'taxe-facture', to: 'pages#result_invoice'

    resources :holiday_rentings
    resources :commerces do
      resources :products, only: [ :new, :create, :edit, :update, :destroy ] do
        resources :cart_items do
          collection do
            get :add_to_cart
            get :remove_to_cart
            get :view_cart
          end
        end
      end
    end
    resources :orders, only: [:show, :new, :create]

    get 'order_items/destroy'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :rentings, :path => 'location-vacances' do
      collection do
        get "remove-photo", to: "rentings#remove_photo"
        get "contact", to: "rentings#contact"
        get "contact_send", to: "rentings#contact_send"
        get "locations-chasse", to: "rentings#chasse"
        get "select", to: "rentings#select"         # collection => no restaurant id in URL
        get 'gites-heidelbeere'
        get 'meuble-heidelbeere', to: 'rentings#meuble_heidelbeere', as: :meuble_heidelbeere
        get 'studio-heidelbeere', to: 'rentings#studio_heidelbeere', as: :studio_heidelbeere
      end
    end

    resources :randonnees
    resources :frequent_asks

    scope 'ligne-maginot-alsace' do
      get '/', to: 'ligne_maginots#index', as: :ligne_maginots
      get 'four-a-chaux-lembach', to: 'ligne_maginots#four_a_chaux'
      get 'dambach', to: 'ligne_maginots#dambach'
    end

    resources :marche_noels, :path => "marches-noel"


    resources :landing_pages, :path => '' do
      collection do
        get '/alimentation', to: 'landing_pages#alimentation'
        get '/chateau-fort-alsace', to: 'landing_pages#chateaux_forts'
        get '/cures-thermales', to: 'landing_pages#cures_thermales'
        scope :"cures-thermales" do
          get '/station-thermale-niederbronn', to: 'landing_pages#station_niederbronn'
          get '/station-thermale-niederbronn/location-cure-niederbronn', to: 'landing_pages#location_cure_niederbronn', as: :location_niederbronn
          get 'station-thermale-morsbronn', to: 'landing_pages#station_morsbronn'
          get '/station-thermale-morsbronn/location-cure-morsbronn', to: 'landing_pages#location_cure_morsbronn', as: :location_morsbronn
        end
        get '/ligne-maginot-alsace', to: 'landing_pages#ligne_maginot_alsace'
        #get '/randonnees', to: 'landing_pages#randonnees'
        get '/strasbourg', to: 'landing_pages#strasbourg'
        get '/parcs-attractions', to: 'landing_pages#attraction'
        #get '/marches-noel', to: 'landing_pages#marches_noel'
      end
    end
    resources :articles, :path => ":category"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

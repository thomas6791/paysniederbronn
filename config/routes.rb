Rails.application.routes.draw do
  scope '(:locale)', locale: /fr|en|de/ do
    root to: 'pages#home'
    get 'about', to: 'pages#about', as: :about
    get 'contact', to: 'pages#contact', as: :contact
    get 'alentours', to: 'pages#alentours', as: :alentours
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :holidayrentings do
      collection do                       # collection => no restaurant id in URL
        get 'gites-heidelbeere'
        get 'gites-heidelbeere/meuble-heidelbeere', to: 'holidayrentings#meuble_heidelbeere', as: :meuble_heidelbeere
        get 'gites-heidelbeere/studio-heidelbeere', to: 'holidayrentings#studio_heidelbeere', as: :studio_heidelbeere
      end
    end
    constraints(subdomain: 'gites-heidelbeere') do
      get '/', to: 'holidayrentings#gites_heidelbeere', as: 'gites-heidelbeere'
      root :to => "holidayrentings#gites_heidelbeere"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  scope '(:locale)', locale: /fr|en|de/ do
    root to: 'pages#home'
    get 'about', to: 'pages#about', as: :about
    get 'contact', to: 'pages#contact', as: :contact
    get 'alentours', to: 'pages#alentours', as: :alentours
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :holiday_rentings do
      collection do                       # collection => no restaurant id in URL
        get 'gites-heidelbeere'
        get 'meuble-heidelbeere', to: 'holiday_rentings#meuble_heidelbeere', as: :meuble_heidelbeere
        get 'studio-heidelbeere', to: 'holiday_rentings#studio_heidelbeere', as: :studio_heidelbeere
      end
    end

    get 'ligne_maginots/index'
    get 'ligne_maginots/alsace'
    get 'ligne_maginots/lorraine'
    get 'ligne_maginots/four_a_chaux'
    get 'ligne_maginots/dambach'

    constraints(subdomain: 'gites-heidelbeere') do
      get '/', to: 'holiday_rentings#gites_heidelbeere', as: 'sub_heidelbeere'
    end
    constraints(subdomain: 'blog') do
      get '/', to: 'holiday_rentings#index', as: 'blog'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

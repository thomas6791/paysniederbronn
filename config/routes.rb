Rails.application.routes.draw do
  scope '(:locale)', locale: /fr|en|de/ do
    root to: 'pages#home'
    get 'about', to: 'pages#about', as: :about
    get 'contact', to: 'pages#contact', as: :contact
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

    get 'ligne-maginots/index', to: 'ligne_maginots#index', as: :ligne_maginots
    get 'ligne_maginots/alsace', to: 'ligne_maginots#alsace'
    get 'ligne_maginots/lorraine', to: 'ligne_maginots#lorraine'
    scope 'ligne-maginot/alsace' do
      get 'four-a-chaux-lembach', to: 'ligne_maginots#four_a_chaux'
      get 'dambach', to: 'ligne_maginots#dambach'
    end
  end
  constraints(subdomain: 'gites-heidelbeere') do
    get 'gites-heidelbeere', to: 'holiday_rentings#gites_heidelbeere', as: 'sub_heidelbeere'
  end
  constraints(subdomain: 'blog') do
    get 'blog', to: 'pages#blog', as: 'blog'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

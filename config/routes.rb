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
        scope '/gites-heidelbeere' do
          get 'meuble-heidelbeere', to: 'holiday_rentings#meuble_heidelbeere', as: :meuble_heidelbeere
          get 'studio-heidelbeere', to: 'holiday_rentings#studio_heidelbeere', as: :studio_heidelbeere
        end

      end
    end
    constraints(subdomain: 'gites-heidelbeere') do
      get '/', to: 'holiday_rentings#gites_heidelbeere', as: 'sub_heidelbeere'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

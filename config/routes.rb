Rails.application.routes.draw do
  get 'holiday_rentings/index'
  get 'holiday_rentings/show'
  get 'holiday_rentings/new'
  get 'holiday_rentings/create'
  get 'holiday_rentings/edit'
  get 'holiday_rentings/update'
  get 'holiday_rentings/destroy'
  scope '(:locale)', locale: /fr|en|de/ do
    root to: 'pages#home'
    get 'about', to: 'pages#about', as: :about
    get 'contact', to: 'pages#contact', as: :contact
    get 'alentours', to: 'pages#alentours', as: :alentours
    #get 'holidayrentings', to: 'pages#holidayrentings', as: :holidayrentings do
    #  collection do
    #    get 'gittes-heidelbeeres'
    #  end
    #end
    resource :holiday_rentings do
      collection do
        get 'gites-heidelbeeres'
      end
    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

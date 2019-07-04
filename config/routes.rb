Rails.application.routes.draw do
  get 'holidayrentings/index'
  get 'holidayrentings/show'
  get 'holidayrentings/new'
  get 'holidayrentings/create'
  get 'holidayrentings/edit'
  get 'holidayrentings/update'
  get 'holidayrentings/destroy'
  scope '(:locale)', locale: /fr|en|de/ do
    root to: 'pages#home'
    get 'about', to: 'pages#about', as: :about
    get 'contact', to: 'pages#contact', as: :contact
    get 'alentours', to: 'pages#alentours', as: :alentours
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

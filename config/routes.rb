Rails.application.routes.draw do
  scope(path_names: { new: 'ny', edit: 'rediger' }) do

    devise_for :accounts, path: 'konto',
                          controllers: {
                            sessions: 'accounts/sessions',
                            registrations: 'accounts/registrations',
                          }
    root to: "home#show"
    resources :businesses, path: 'virksomhed'
    resources :developers, path: 'udviklere'
    resources :businesses, path: 'virksomhed'
  end
  get '/om', to: 'about#show', as: :about
end

Rails.application.routes.draw do

  get "/404", to: "errors#not_found", via: :all
  get "/500", to: "errors#internal_server_error", via: :all

  scope(path_names: { new: 'ny', edit: 'rediger' }) do

    devise_for :accounts, path: 'konto',
                          controllers: {
                            sessions: 'accounts/sessions',
                            registrations: 'accounts/registrations',
                          }
    root to: "home#show"
    resources :businesses, path: 'virksomhed'
    resources :developers, path: 'udviklere'
    resources :conversations, path: 'chat' do
      resources :messages
    end
    resources :businesses, path: 'virksomhed'

  end
  get '/om', to: 'about#show', as: :about
  
end

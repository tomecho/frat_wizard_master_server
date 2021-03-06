Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "user/omniauth_callbacks" }
  get '/', to: 'application#home', as: 'home'

  post '/verify_facebook_token', to: 'application#verify_facebook_token'

  namespace :api do    
    get '/location/within', to: 'location#within'
    resources :location, except: %i(update)

    get '/user/:id/location', to: 'user#location'
    post '/user/:id/use_org_claim_code', to: 'user#use_org_claim_code'
    resources :user, except: %i(delete create)

    resources :orgs, except: %i(new edit)
    
    get '/org_claim_codes', to: 'org_claim_codes#show'
    resources :org_claim_codes, only: %i(create destroy)

    post '/groups/:id/add_user', to: 'groups#add_user'
    delete '/groups/:id/remove_user', to: 'groups#remove_user'
    post '/groups/:id/add_permission', to: 'groups#add_permission'
    delete '/groups/:id/remove_permission', to: 'groups#remove_permission'
    resources :groups, except: %i(edit new)
  end
end

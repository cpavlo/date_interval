Rails.application.routes.draw do

  resources :dated_resources
  mount DateInterval::Engine => '/date_interval'

  root 'dated_resources#index'
end

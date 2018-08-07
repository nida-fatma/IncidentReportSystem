Rails.application.routes.draw do
	root 'incident_reports#new'
  resources :incident_reports, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

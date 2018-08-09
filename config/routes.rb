# frozen_string_literal: true

Rails.application.routes.draw do
  root 'incident_reports#new'
  resources :incident_reports, only: [:create]
  resources :detail_incident_reports, only: %i[new create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Redirect to index page if no routes exist
  match '*path', to: redirect('/'), via: :all
end

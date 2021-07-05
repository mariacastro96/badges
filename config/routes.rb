Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/submit', to: 'badges#submit_form'
  get '/success', to: 'badges#success'

  # root to: "badges#submit"
end

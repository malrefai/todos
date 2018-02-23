Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope defaults: { format: "json" } do
    scope "api" do
      resources :todos do
        resources :items
      end
    end
  end
end

Spree::Core::Engine.add_routes do
  namespace :admin do
    concern :positionable do
      collection do
        post :update_positions
      end
    end
    resources :question_categories, :questions, concerns: :positionable
  end
  get 'faq', to: 'faqs#index'
end

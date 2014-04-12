Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :question_categories
  end
  get 'faq', to: 'faqs#index'
end

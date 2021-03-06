Rails.application.routes.draw do
 
  resources :partnerships

  resources :transports

  resources :reasons

  resources :num_visitors
  devise_for :users

  resources :countries

  resources :visitor_packages

  resources :swazi_visitor_infos

  resources :international_visitor_infors

  resources :users

  resources :packages

  resources :establishments

  resources :users

  resources :visitor_infos

  resources :dashboards

  resources :establishment_dashboards

  resources :sta_reports

  get "/report" => "dashboards#report"

  get "/dashboards/csvfile" => "dashboards#csvfile"

  get "/dashboards/SmppReports" => "dashboards#SmppReports"
  get "/sta_reports" => "sta_reports#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'dashboards#index'

  get 'visitor_infos/index' => 'visitor_infos#index'
  get 'sta_reports/index' => 'sta_reports#index'

  #devise_for :user,
             #:controllers => {
                # :registrations => "user/registrations"
             #}, :path_prefix => "system"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'posts#index'
  
  #게시글에 관련
  get '/' => 'posts#index', as: 'posts_index'
  get '/new' => 'posts#new', as: 'posts_new'
  get '/show_post/:post_id' => 'posts#show_post', as: 'posts_showpost'
  get '/show' => 'posts#show', as: 'posts_show'
  get '/destroy/:post_id' => 'posts#destroy', as: 'posts_destroy'
  get '/edit/:post_id' => 'posts#edit', as: 'posts_edit'
  
  post '/create' => 'posts#create', as: 'posts_create'
  patch '/upload/:post_id' => 'posts#upload', as: 'posts_upload'
  
  #댓글에 관련
  post '/posts/:post_id/comments/cmtcreate'=> 'posts#cmtcreate', as: 'cmt_create'
  get '/posts/:post_id/comments/:reply_id' => 'posts#cmtdestroy', as: 'cmt_destroy'
  get '/posts/:post_id/cmtedit/:reply_id' => 'posts#cmtedit', as: 'cmt_edit'
  post '/posts/:post_id/cmtupload/:reply_id' => 'posts#cmtupload', as: 'cmt_upload'
  
  #대댓글
  post '/comments/:reply_id/recomments/recreate' => 'posts#recreate', as: 're_create'
  get '/comments/:reply_id/recomments/:rereply_id' => 'posts#redestroy', as: 're_destroy'
  get '/comments/:reply_id/recomments/:rereply_id/reedit' => 'posts#reedit', as: 're_edit'
  post '/comments/:reply_id/recomments/:rereply_id/reupload' => 'posts#reupload', as: 're_upload'
  
  #마이 페이지
  get '/mypage' => 'mypage#mypage_index'
  get '/test' => 'posts#test'

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

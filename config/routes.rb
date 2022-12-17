Rails.application.routes.draw do

  scope module: :public do
    root 'homes#top'
    resources :contents, only: [:create, :index, :show]
    #/:何とかは全部パスパラメータ(vote)
    resources :ng_expressions, only: [:index, :show, :create] do
      post 'ng_answer/:vote', to: 'ng_answers#create', as: "ng_answer_vote"
      resources :comments, only: [:new, :create, :index, :edit, :update, :destroy]
      resource :bookmarks, only: [:create, :destroy]
    end
    get 'search', to: 'searches#search'
    get 'customer/mypage', to: 'customers#show', as: 'customer_mypage'
    resources :customers, only: [:edit, :update]
      # 退会確認画面
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'customer_unsubscribe'
    # 論理削除用のルーティング
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'customer_withdrawal'
    #resources :ng_expressions, only: [:index, :show, :create] # TODO: ルーティング敵には上の方が正しいのでこの行は消すべき

  end
# 顧客用
# URL /customers/sign_in ...
devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_scope :customer do
  post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
end

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    resources :ng_genres, except: [:new, :show]
    resources :media_genres, except: [:new, :show]
    resources :story_genres, except: [:new, :show]
    resources :ng_expressions, except: [:new] do
      resources :comments, only: [:index, :destroy]
    end
    resources :customers, only: [:index, :show, :edit, :update]
    resources :contents, except: [:new]
    resources :ng_tagging_contents, only: [:create, :destroy]
    resources :media_tag_contents, only: [:create, :destroy]
    resources :story_tag_contents, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

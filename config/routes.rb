Rails.application.routes.draw do

  scope module: :public do
    root 'homes#top'
    resources :contents, only: [:index, :show]
    resources :ng_expressions, only: [:index, :show] do
     resource :votes, only: [:create, :destroy]
    end
  end
# 顧客用
# URL /customers/sign_in ...
devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    resources :ng_genres, except: [:new]
    resources :media_genres, except: [:new]
    resources :story_genres, except: [:new]
    resources :ng_expressions, except: [:new]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :contents
    resources :ng_tagging_contents, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

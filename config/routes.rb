Rails.application.routes.draw do
  # get 'profiles/new'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "groups#index"
  resources :users, only: [:index, :new, :create, :show, :edit, :update] do
  resources :groups, only: [:new, :create, :edit, :update] 
end

  # マイページ
  resources :mypage, only: [:index, :edit, :update, :destroy, :show] do
    resources :comments, only: [:index, :create]
    member do
      get :profile
      get :message
    end
  end

  # マイページ
  resources :profiles
  #  only: [:index, :edit, :update, :destroy, :show] do
  # end

    # 新規登録ページ
    resources :signup do
      collection do
        get :step1 # ここで、入力の全て完了
        get :step2
        get :done # 登録完了後のページ
      end
    end
end

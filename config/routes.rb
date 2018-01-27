Rails.application.routes.draw do
  get 'tops/index'

  # get 'sessions/new'

##  heroku 登録用に追記
##  root 'tops#blogs' これじゃダメだった。なんで？↓エラーでルーティングが出てて何となく表示させたいパスにしたら通った！
  # root 'blogs#index'

##  get '/contacts', to: 'contacts#index'#課題１問い合わせ画面作成
  resources :contacts

  get '/stocks', to: 'stocks#index'#小課題rails入門４

##  get '/blogs', to: 'blogs#index' #追記する
  resources :blogs

##  ログインシステムのルーティング設定
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
##  ログインシステム：起動時にログイン画面が表示されるようにする
  # root 'sessions#new'

  ##  叩いたのお気に入り機能で追記
  resources :favorites, only: [:create, :destroy]

  ##  ログインシステム：最初にトップ画面に飛ぶように設定
  resources :tops

  ##  ログインシステム：起動時にログイン画面が表示されるようにする
  root 'tops#index'

  ##  ActionMailer の設定にて追記
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end

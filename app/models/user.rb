class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[twitter google_oauth2]

       # SNSログイン機能。twitterかgoogleからユーザー情報を引っ張り出してreturnする。
        # このときSNScredentialsテーブルにはuidとproviderを保存するが、User情報は保存しない。
        def self.find_oauth(auth)
          uid = auth.uid
          provider = auth.provider
          snscredential = SnsCredential.where(uid: uid, provider: provider).first
          if snscredential.present? #sns登録のみ完了してるユーザー
            user = User.where(id: snscredential.user_id).first
            unless user.present? #ユーザーが存在しないなら
              user = User.new(
                nickname: auth.info.name,
                email: auth.info.email,
              )
            end
            sns = snscredential
          else #sns登録 未
            user = User.where(email: auth.info.email).first
          if user.present? #会員登録 済
            else #会員登録 未
              user = User.new(
                nickname: auth.info.name,
                email: auth.info.email,
              )
              sns = SnsCredential.new(
                uid: uid,
                provider: provider,
              )
            end
          end
          return {  user: user , sns: sns } # hashでsnsのidを返り値として保持しておく
        end

  has_one  :profile, dependent: :destroy
  has_many :comments
  has_many :sns_credentials, dependent: :destroy

end

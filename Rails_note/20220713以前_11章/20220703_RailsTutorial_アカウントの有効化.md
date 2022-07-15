# 11.3.1authenticated?メソッドの抽象化

受け取ったパラメータに応じて呼び出すメソッドを切り替える手法を使う cf)メタプログラミング

sendメソッド

レシーバの持っているメソッドを呼び出すことができる
object.send(メソッドa, メソッドaの引数) 

例
```ruby
class User
	def hoge(x)
		puts "aaa"
	end
end

user = User.new

user.hoge

user.send(:hoge)
user.send("hoge")
```

sendメソッド適用前
```ruby
  # トークンがダイジェストと一致したらtrueを返す
def authenticated?(remember_token)
  digest = self.send("remember_digest")
  return false if digest.nil?
  BCrypt::Password.new(digest).is_password?(remember_token)
end
```

sendメソッド適用後
引数attribute, token
```ruby
  # トークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
```

### 演習
>1.コンソール内で新しいユーザーを作成してみてください。新しいユー>ザーの記憶トークンと有効化トークンはどのような値になっているでしょうか? また、各トークンに対応するダイジェストの値はどうなっているでしょうか?

>2.>リスト 11.26で抽象化したauthenticated?メソッドを使って、先ほどの各トークン/ダイジェストの組み合わせで認証が成功することを確認してみましょう。

```ruby
user = User.create(name: "tune", email: "tune@sample.com", password: "123456",password_confirmation: "123456")
 => #<User id: 102, name: "tune", email: "tune@sample.com", created_at: "2022-07-03 14:28:11", updated_at: "2022-07-03 14:28:11", password_digest: [FILTERED], remember_digest: nil, admin: false, activation_digest: "$2a$12$Y6Uii35iI8ReMHXSFIfim.TjYIQqeymbl5w59gar0FX...", activated: false, activated_at: nil> 

user.remember_token
 => nil

user.activation_token
 => "Sgv69rZhi_Bs2nByr_QJdQ"

# 記憶トークン・ダイジェスト...まだ有効化されていないため、値が入っていない
 >> user.remember_digest
=> nil 

 # 有効化トークン・ダイジェスト...before_create により値が入っている
>> user.activation_digest
 => "$2a$12$Y6Uii35iI8ReMHXSFIfim.TjYIQqeymbl5w59gar0FX0COtynYZtG" 

# 有効化トークン・ダイジェストの認証の成功を確認
user.authenticated?(:activation, user.activation_token)
 => true 

# 記憶トークン・ダイジェストを作成
user.remember_token = User.new_token
 => "zYh_TASNTRTSLhoz79vDaA" 

user.update_attribute(:remember_digest, User.digest(user.remember_token))

   (0.1ms)  SAVEPOINT active_record_1
  User Update (0.1ms)  UPDATE "users" SET "updated_at" = ?, "remember_digest" = ? WHERE "users"."id" = ?  [["updated_at", "2022-07-03 15:00:40.226578"], ["remember_digest", "$2a$12$Ap8ENjBy3IrQDRfLX3g9J.DTHVcoNgYmTReShdE73YX4lh8MIaJha"], ["id", 102]]
   (0.1ms)  RELEASE SAVEPOINT active_record_1

# 記憶トークン・ダイジェストの認証の成功を確認
user.authenticated?(:remember,user.remember_token)
 => true 
```

11.3.2 editアクションで有効化

editアクション
paramsハッシュで渡されたメールアドレスに対応するユーザーを認証

```ruby
if user && !user.activated? && user.authenticated?(:activation, params[:id])
```


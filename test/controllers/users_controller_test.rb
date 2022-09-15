require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "should redirect edit when not logged in" do # ログインしていない時はリダイレクトで戻るテスト
    get edit_user_path(@user)    #  ユーザーがeditしようとする
    assert_not flash.empty?      # flash.empty?がfalse（flashがある時）であればテストはOK
    assert_redirected_to login_url # ログイン画面に戻る（ゴール）
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name,
                                             email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)                            # otherユーザーでログインした
    get edit_user_path(@user)                         # 別ユーザーのログインページを updateしようとする。
    assert flash.empty?                               # フラッシュメッセージがからの時にテストOK
    assert_redirected_to root_url                     # ルートアドレスに飛ぶ
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { name: @user.name,
                                             email: @user.email } }
    assert flash.empty?
		assert_redirected_to root_url
  end
end

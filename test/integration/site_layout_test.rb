require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	
	def setup
		@user = users(:michael)
	end
  
	test "layout links" do
		get root_path
		assert_template 'static_pages/home'
		assert_select "a[href=?]", root_path, count: 2
		assert_select "a[href=?]", help_path
		assert_select "a[href=?]", about_path
		assert_select "a[href=?]", contact_path
		get contact_path
		assert_select "title", full_title("Contact")
		get signup_path
		assert_select "title", full_title("Sign Up")
	end
	
	test "should redirect to logged in user" do
    log_in_as(@user, password: 'password', remember_me: '1')
		get user_path(@user)
		assert_select "a[href=?]", root_path, count: 2
		assert_select "a[href=?]", help_path
		assert_select "a[href=?]", users_path
		assert_select "a[href=?]", logout_path
		assert_select "a[href=?]", contact_path
		get contact_path
		assert_select "title", full_title("Contact")
		get signup_path
		assert_select "title", full_title("Sign Up")
	end

	test "layout links when logged in user" do
    log_in_as(@user)
    get root_path
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", logout_path
    assert_match @user.active_relationships.count.to_s, response.body
    assert_match @user.passive_relationships.count.to_s, response.body
  end

	test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.microposts.count.to_s, response.body
    assert_select 'div.pagination', count: 1
    @user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
    assert_match @user.active_relationships.count.to_s, response.body
    assert_match @user.passive_relationships.count.to_s, response.body
  end
end

require 'rails_helper'

describe "create User and login" do
  it "adds a user and logs in" do
    visit '/'
    click_on 'Sign Up'
    fill_in 'First name', :with => 'Batman'
    fill_in 'Last name', :with => 'Wayne'
    fill_in 'Email', :with => 'J@email.com'
    fill_in 'Password', :with => 'Frank'
    fill_in 'Password confirmation', :with => 'Frank'
    click_on 'Sign Up'
    fill_in 'Email', :with => 'J@email.com'
    fill_in 'Password', :with => 'Frank'
    click_on 'Log in'
    expect(page).to have_content 'J@email.com'
  end
end

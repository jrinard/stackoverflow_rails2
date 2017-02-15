require 'rails_helper'

describe "Users" do
  it "Create and Login" do
    visit '/questions'
    user = FactoryGirl.create(:user)
    visit '/'
    fill_in 'Email', :with => 'J@email.com'
    fill_in 'Password', :with => 'Frank'
    click_on 'Login'
    expect(page).to have_content 'J@email.com'
  end
end

describe "Users" do
  it "Create and Logout" do
    visit '/questions'
    user = FactoryGirl.create(:user)
    visit '/'
    fill_in 'Email', :with => 'J@email.com'
    fill_in 'Password', :with => 'Frank'
    click_on 'Login'
    click_on 'Log-out'
    expect(page).to_not have_content 'J@email.com'
  end
end

describe "Questions" do
  it "Create Question" do
    visit '/users/new'
    user = FactoryGirl.create(:user)
    visit '/'
    fill_in 'Email', :with => 'J@email.com'
    fill_in 'Password', :with => 'Frank'
    click_on 'Login'
    click_on 'New Question'
    fill_in 'Question', :with => 'q1'
    click_on 'Create Question'
    expect(page).to have_content 'q1'
  end
end

describe "Questions" do
  it "Edit Question" do
    visit '/users/new'
    user = FactoryGirl.create(:user)
    visit '/'
    fill_in 'Email', :with => 'J@email.com'
    fill_in 'Password', :with => 'Frank'
    click_on 'Login'
    click_on 'New Question'
    fill_in 'Question', :with => 'q1'
    click_on 'Create Question'
    click_on 'q1'
    click_on 'Edit Question'
    fill_in 'Question', :with => 'q2'
    click_on 'Update Question'
    expect(page).to have_content 'q2'
  end
end

describe "Questions" do
  it "Delete Question" do
    visit '/users/new'
    user = FactoryGirl.create(:user)
    visit '/'
    fill_in 'Email', :with => 'J@email.com'
    fill_in 'Password', :with => 'Frank'
    click_on 'Login'
    click_on 'New Question'
    fill_in 'Question', :with => 'q1'
    click_on 'Create Question'
    click_on 'q1'
    click_on 'Delete Question'
    expect(page).to_not have_content 'q1'
  end
end

describe "Error on login" do
  it "bad log" do
    user = FactoryGirl.create(:user)
    visit '/'
    fill_in 'Email', :with => 'J@email.com'
    fill_in 'Password', :with => 'Franc'
    click_on 'Login'
    expect(page).to have_content 'There was a problem logging you in'
  end
end

require 'rails_helper'

describe "Answer" do
  it "New Answer" do
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
    click_on 'New Answer'
    fill_in 'Content', :with => 'a1'
    click_on 'Create Answer'
    expect(page).to have_content 'a1'
  end
end

describe "Answer" do
  it "Edit Answer" do
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
    click_on 'New Answer'
    fill_in 'Content', :with => 'a1'
    click_on 'Create Answer'
    click_on 'Edit'
    fill_in 'Content', :with => 'a2'
    click_on 'Update Answer'
    expect(page).to have_content 'a2'
  end
end

describe "Answer" do
  it "Delete Answer" do
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
    click_on 'New Answer'
    fill_in 'Content', :with => 'a1'
    click_on 'Create Answer'
    click_on 'Delete'
    expect(page).to_not have_content 'a2'
  end
end

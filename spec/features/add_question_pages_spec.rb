require 'rails_helper'

describe "All process" do
  it "All" do
    visit '/questions'
    user = FactoryGirl.create(:user)
    visit '/'
    fill_in 'Email', :with => 'J@email.com'
    fill_in 'Password', :with => 'Frank'
    click_on 'Log in'
    click_on 'New Question'
    fill_in 'Query', :with => 'q1?'
    click_on 'Create Question'
    click_on 'q1?'
    click_on 'Edit Question'
    fill_in 'Query', :with => 'q2'
    click_on 'Update Question'
    click_on 'q2'
    click_on 'New Answer'
    fill_in 'Content', :with => 'a1'
    click_on 'Create Answer'
    click_on 'Up Vote'
    click_on 'Down Vote'
    click_on 'Edit'
    fill_in 'Content', :with => 'a2'
    click_on 'Update Answer'
    click_on 'Delete'
    click_on 'All Questions'
    click_on 'q2'
    click_on 'Delete Question'
    click_on 'Log-out'
    expect(page).to have_content 'You\'ve been logged'
  end
end

describe "bad login" do
  it "bad log" do
    user = FactoryGirl.create(:user)
    visit '/'
    fill_in 'Email', :with => 'J@email.com'
    fill_in 'Password', :with => 'Franc'
    click_on 'Log in'
    expect(page).to have_content 'There was a problem logging you in'
  end
end

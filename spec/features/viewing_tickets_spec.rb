require 'rails_helper'

RSpec.feature 'Users can view tickets' do
  before do
    atom = FactoryGirl.create(:project, name: 'Atom')
    FactoryGirl.create(:ticket, project: atom, name: 'Make it',
     description: 'Bugfix. Hard solution for problem in today')

    chrome = FactoryGirl.create(:project, name: 'Chrome')
    FactoryGirl.create(:ticket, project: chrome, name: 'Doing it',
     description: 'Bugfix. Hard solution for problem in tomorrow')

    visit '/'
  end

  scenario 'for a given project' do
    click_link 'Atom'

    expect(page).to have_content 'Make it'
    expect(page).to have_no_content 'Bugfix. Hard solution for problem in tomorrow'

    click_link 'Make it'
    within('#ticket h2') do
      expect(page).to have_content 'Make it'
    end

    expect(page).to have_content 'Bugfix. Hard solution for problem in today'
  end
end

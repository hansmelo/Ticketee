require 'rails_helper'

RSpec.feature 'Users can delete project' do
  scenario 'successfully' do
    FactoryGirl.create(:project, name: 'Atom')
    visit '/'

    click_link 'Atom'
    click_link 'Delete Project'

    expect(page).to have_content 'Project has been deleted.'
    expect(page.current_url).to eq projects_url
    expect(page).to have_no_content 'Atom'
  end
end

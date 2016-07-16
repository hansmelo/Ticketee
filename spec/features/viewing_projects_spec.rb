require 'rails_helper'

RSpec.feature 'Users can view projects' do
  scenario 'with the project can view projects' do
    project = FactoryGirl.create(:project, name: 'Atom')

    visit '/'
    click_link 'Atom'
    expect(page.current_url).to eq project_url(project)
  end
end

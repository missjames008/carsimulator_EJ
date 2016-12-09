require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  context 'Running car simulator' do
    Steps 'Creating a car' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I see "Welcome to the Car Simulator"' do
        # save_and_open_page   
        expect(page).to have_content("Welcome to the Car Simulator")
      end
    end
  end
end

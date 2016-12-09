require 'rails_helper'

RSpec.feature "SimulateCars", type: :feature do
  context 'Creating a car for simulating' do
    Steps 'Creating a car' do
      Given 'I am on the landing page' do
        visit '/'
      end
      When 'I fill in the car make, model, and year' do
        fill_in 'make', with: 'Batmobile'
        fill_in 'model', with: 'Nolan'
        fill_in 'year', with: '2006'
      end
      And 'I can submit the car information' do
        click_button 'Create New Car'
      end
      Then "I can see the car's info" do
        expect(page).to have_content('Make: Batmobile')
        expect(page).to have_content('Model: Nolan')
        expect(page).to have_content('Year: 2006')
      end
      And 'I can see the speed of the car' do
        expect(page).to have_content('Speed: 0 mph')
      end
    end
  end

  context 'Simulating a car' do
    Steps 'Speeding up a car' do
      Given 'I have created a car' do
        visit '/'
        fill_in 'make', with: 'Batmobile'
        fill_in 'model', with: 'Nolan'
        fill_in 'year', with: '2006'
        click_button 'Create New Car'
      end
      Then "the car's speed is 0 mph" do
        expect(page).to have_content('Speed: 0 mph')
      end
      When 'I can press the accelerate button' do
        click_button 'Accelerate'
      end
      Then 'The car speeds up by 10 mph' do
        expect(page).to have_content('Speed: 10 mph')
      end
    end
  end
end

require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Dinami') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
  end
  
  describe "Give Feedback page" do 
    before {visit give_feedback_path }
    
    it { should have_content("Give Feedback") }
    it { should have_title(full_title("Give Feedback")) }
    
    describe "when no feedback request key is provided" do
      it { should have_content("You must provide a feedback key!") }
    end
    
    describe "when feedback request key is not valid valid" do
      before { visit give_feedback_path + "?fbk=invalid_key" }
      pending "Need to figure out how to add optional params in paths"
      # it { should have_content("Count not locate user") }
    end
    
    describe "when feedback request key is valid" do
      pending "Need to figure out how to add optional params in paths"
    end
    
  end
  
  describe "Request Feedback page" do
    before { visit request_feedback_path }
    
    it { should have_content("Request Feedback") }
    it { should have_title(full_title("Request Feedback")) }
    
    describe "when not signed in" do
      it { should have_content("not signed in") }
    end
    
    describe "when signed in" do
      let(:user) { FactoryGirl.create(:user) }
      before do 
        sign_in user
        visit request_feedback_path
      end
      it { should have_content(user.feedback_request_key)}
    end
  end
end

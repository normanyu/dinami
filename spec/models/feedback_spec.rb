require 'spec_helper'

describe Feedback do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # @feedback = Feedback.new(content: "bold", user_id: user.id, giver_email: "shirley@princeton.edu")
    @feedback = user.feedbacks.build(content: "bold", giver_email: "shirley@princeton.edu")
  end

  subject { @feedback }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:giver_email) }
  its(:user) { should eq user }
  
  it { should be_valid }
  
  describe "when user_id is not present" do
    before { @feedback.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "when giver_email is not present" do
    before { @feedback.giver_email = nil }
    it { should_not be_valid }
  end
end
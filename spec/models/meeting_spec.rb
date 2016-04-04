require 'rails_helper'

RSpec.describe Meeting, type: :model do
  let(:meeting) { FactoryGirl.create(:meeting) }

  describe "associatons" do
    it { should have_many(:notes) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
		it { should validate_presence_of(:date) }
  end

  describe "#initialization" do
    context "every meeting has certain details" do
      it "returns a name" do
        expect(meeting.name).to eq("Discuss App Requirements")
      end

      it "returns attendees" do
        expect(meeting.attendees).to eq("John Doe, Jane Doe")
      end

      it "returns day" do
        expect(meeting.date.day).to eq(DateTime.now.day)
      end

      it "returns description" do
        expect(meeting.description).to eq("Discuss goals, specs, and deadline.")
      end

      it "returns location" do
        expect(meeting.location).to eq("Virtual")
      end
    end
  end
end

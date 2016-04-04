require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:note) { FactoryGirl.create(:note) }

  describe "associatons" do
    it { should belong_to(:meeting) }
  end

  describe "validations" do
    it { should validate_presence_of(:content) }
		it { should validate_presence_of(:meeting) }
  end

  describe "#initialization" do
    context "every note has certain details" do
      it "returns content" do
        expect(note.content).to eq("App should be delivered within two weeks.")
      end

      it "returns Meeting to which it belongs" do
        expect(note.meeting.class).to eq(Meeting)
      end
    end
  end
end

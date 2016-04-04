require 'rails_helper'

RSpec.describe NoteType, type: :model do
  let(:note_type) { FactoryGirl.create(:note_type) }

  describe "associatons" do
    it { should have_many(:note_records) }
    it { should have_many(:notes) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "initialization" do
    context "every note_type has certain details" do
      it "returns name" do
        expect(note_type.name).to eq("Pre")
      end
    end
  end
end

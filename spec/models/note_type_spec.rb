require 'rails_helper'

RSpec.describe NoteType, type: :model do
  let(:note_type) { FactoryGirl.create(:note_type) }

  describe "associatons" do
    it { should belong_to(:note) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
		it { should validate_presence_of(:note) }
  end

  describe "#initialization" do
    context "every note_type has certain details" do
      it "returns name" do
        expect(note_type.name).to eq("Pre")
      end

      it "returns Meeting to which it belongs" do
        expect(note_type.note.class).to eq(Note)
      end
    end
  end
end

require 'rails_helper'

RSpec.describe NoteRecord, type: :model do
  let(:note_record) { FactoryGirl.create(:note_record) }

  describe "associatons" do
    it { should belong_to(:note) }
    it { should belong_to(:note_type) }
  end

  describe "validations" do
    it { should validate_presence_of(:note) }
		it { should validate_presence_of(:note_type) }
  end

  describe "initialization" do
    context "every note_record has certain details" do
      it "returns Note to which it belongs" do
        expect(note_record.note.class).to eq(Note)
      end

      it "returns NoteType to which it belongs" do
        expect(note_record.note_type.class).to eq(NoteType)
      end
    end
  end
end

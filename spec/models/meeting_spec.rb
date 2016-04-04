require 'rails_helper'

RSpec.describe Meeting, type: :model do
  let(:meeting) { FactoryGirl.create(:meeting) }
  let(:note) { FactoryGirl.create(:note) }
  let(:note_record) { FactoryGirl.create(:note_record) }

  describe "associatons" do
    it { should have_many(:notes) }
  end

  describe "validations" do
    it { should validate_presence_of(:organizer) }
		it { should validate_presence_of(:subject) }
		it { should validate_presence_of(:start_date) }
		it { should validate_presence_of(:end_date) }
  end

  describe "initialization" do
    context "every meeting has certain details" do
      it "returns an organizer" do
        expect(meeting.organizer).to eq("John Doe")
      end

      it "returns a subject" do
        expect(meeting.subject).to eq("Discuss App Requirements")
      end

      it "returns start day" do
        expect(meeting.start_date.day).to eq(DateTime.now.day)
      end

      it "returns end day" do
        expect(meeting.end_date.day).to eq(DateTime.now.day)
      end

      it "returns attendees" do
        expect(meeting.attendees).to eq("John Doe, Jane Doe")
      end

      it "returns body" do
        expect(meeting.body).to eq("Discuss goals, specs, and deadline.")
      end

      it "returns location" do
        expect(meeting.location).to eq("Virtual")
      end
    end
  end

  describe "#has_notes?" do
    context "notes exist" do
      it "returns true" do
        expect(note.meeting.has_notes?).to eq(true)
      end
    end

    context "notes do not exist" do
      it "returns false" do
        expect(meeting.has_notes?).to eq(false)
      end
    end
  end

  describe "#note_types" do
    context "does not have any note types" do
      it "returns empty array" do
        expect(meeting.note_types).to eq([])
      end
    end

    context "only has one note type" do
      it "returns %w(Pre)" do
        meeting = note_record.note.meeting

        expect(meeting.note_types).to eq(["Pre"])
      end
    end

    context "only has two note types" do
      it "returns %w(Pre Current)" do
        meeting = note_record.note.meeting
        current_note = Note.create!(content: "hi", meeting: meeting)
        cnt = NoteType.create!(name: "Current")
        NoteRecord.create!(note: current_note, note_type: cnt)

        expect(meeting.note_types).to eq(["Pre", "Current"])
      end
    end

    context "it has all three note types" do
      it "returns %w(Pre Current Post)" do
        meeting = note_record.note.meeting
        current_note = Note.create!(content: "during", meeting: meeting)
        post_note = Note.create!(content: "after", meeting: meeting)
        cnt = NoteType.create!(name: "Current")
        pnt = NoteType.create!(name: "Post")
        NoteRecord.create!(note: current_note, note_type: cnt)
        NoteRecord.create!(note: post_note, note_type: pnt)

        expect(meeting.note_types).to eq(["Pre", "Current", "Post"])
      end
    end
  end

  describe "#has_pre_notes?" do
    context "pre notes exist" do
      it "returns true" do
        expect(note_record.note.meeting.has_pre_notes?).to eq(true)
      end
    end

    context "pre notes do not exist" do
      it "returns false" do
        expect(meeting.has_pre_notes?).to eq(false)
      end
    end
  end

  describe "#has_current_notes?" do
    context "current notes exist" do
      it "returns true" do
        meeting = note_record.note.meeting
        current_note = Note.create!(content: "hi", meeting: meeting)
        cnt = NoteType.create!(name: "Current")
        NoteRecord.create!(note: current_note, note_type: cnt)

        expect(note_record.note.meeting.has_current_notes?).to eq(true)
      end
    end

    context "current notes do not exist" do
      it "returns false" do
        expect(meeting.has_current_notes?).to eq(false)
      end
    end
  end

  describe "#has_post_notes?" do
    context "current notes exist" do
      it "returns true" do
        meeting = note_record.note.meeting
        current_note = Note.create!(content: "during", meeting: meeting)
        post_note = Note.create!(content: "after", meeting: meeting)
        cnt = NoteType.create!(name: "Current")
        pnt = NoteType.create!(name: "Post")
        NoteRecord.create!(note: current_note, note_type: cnt)
        NoteRecord.create!(note: post_note, note_type: pnt)

        expect(note_record.note.meeting.has_post_notes?).to eq(true)
      end
    end

    context "current notes do not exist" do
      it "returns false" do
        expect(meeting.has_post_notes?).to eq(false)
      end
    end
  end
end

FactoryGirl.define do
  factory :meeting do
    api_id 1
    organizer "John Doe"
    subject "Discuss App Requirements"
    start_date DateTime.now
    end_date DateTime.now
    attendees "John Doe, Jane Doe"
    body "Discuss goals, specs, and deadline."
    location "Virtual"
  end

  factory :note do
    content "App should be delivered within two weeks."

    meeting
  end

  factory :note_type do
    name "Pre"
  end

  factory :note_record do
    note
    note_type
  end
end

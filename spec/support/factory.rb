FactoryGirl.define do
  factory :meeting do
    name "Discuss App Requirements"
    attendees "John Doe, Jane Doe"
    date DateTime.now
    description "Discuss goals, specs, and deadline."
    location "Virtual"
  end

  factory :note do
    content "App should be delivered within two weeks."

    meeting
  end

  factory :note_type do
    name "Pre"

    note
  end
end

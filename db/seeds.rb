Rails.logger.info "==============================================="
Rails.logger.info "Creating Meetings"
Rails.logger.info "==============================================="

10.times do
	attendees = "#{Faker::Name.name}, #{Faker::Name.name}, #{Faker::Name.name}"
	meeting = Meeting.new(
    name: Faker::Company.bs,
    date: Faker::Date.backward(1000),
    attendees: attendees,
		description: Faker::Hacker.say_something_smart,
		location: Faker::Address.city
  )
  Rails.logger.info "Meeting \'#{meeting.name}\' created." if meeting.save
end

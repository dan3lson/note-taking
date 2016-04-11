Rails.logger.info "==============================================="
Rails.logger.info "Creating Note Types"
Rails.logger.info "==============================================="

pre = NoteType.create!(name: "Pre")
Rails.logger.info "Note Type \'#{pre.name}\' created."
current = NoteType.create!(name: "Current")
Rails.logger.info "Note Type \'#{current.name}\' created."
post = NoteType.create!(name: "Post")
Rails.logger.info "Note Type \'#{post.name}\' created."

# Rails.logger.info "==============================================="
# Rails.logger.info "Creating Meetings"
# Rails.logger.info "==============================================="
#
# 10.times do
# 	attendees = "#{Faker::Name.name}, #{Faker::Name.name}, #{Faker::Name.name}"
# 	meeting = Meeting.create!(
#     organizer: Faker::Name.name,
#     subject: Faker::Company.bs,
#     start_date: Faker::Date.backward(10),
#     end_date: Faker::Date.forward(10),
#     attendees: attendees,
# 		body: Faker::Hacker.say_something_smart,
# 		location: Faker::Address.city
#   )
#   Rails.logger.info "Meeting \'#{meeting.subject}\' created."
# end
#
# Rails.logger.info "==============================================="
# Rails.logger.info "Creating Notes"
# Rails.logger.info "==============================================="
#
# meetings = Meeting.all.shuffle
#
# note_1 = Note.create!(
# 	content: Faker::Lorem.paragraph,
# 	meeting: meetings[0]
# )
# Rails.logger.info "Note #{note_1.id} created."
# note_2 = Note.create!(
# 	content: Faker::Lorem.paragraph,
# 	meeting: meetings[0]
# )
# Rails.logger.info "Note #{note_2.id} created."
# note_3 = Note.create!(
# 	content: Faker::Lorem.paragraph,
# 	meeting: meetings[0]
# )
# Rails.logger.info "Note #{note_3.id} created."
# note_4 = Note.create!(
# 	content: Faker::Lorem.paragraph,
# 	meeting: meetings[3]
# )
# Rails.logger.info "Note #{note_4.id} created."
# note_5 = Note.create!(
# 	content: Faker::Lorem.paragraph,
# 	meeting: meetings[4]
# )
# Rails.logger.info "Note #{note_5.id} created."
#
# Rails.logger.info "==============================================="
# Rails.logger.info "Creating Note Records"
# Rails.logger.info "==============================================="
#
# notes = Note.all
# note_types = NoteType.all
# pre_note_type = note_types[0]
# current_note_type = note_types[1]
# post_note_type = note_types[2]
#
# note_record_1_pre = NoteRecord.create!(
# 	note: notes[0],
# 	note_type: pre_note_type
# )
# Rails.logger.info "NoteRecord #{note_record_1_pre.id} created."
# note_record_2_current = NoteRecord.create!(
# 	note: notes[1],
# 	note_type: current_note_type
# )
# Rails.logger.info "NoteRecord #{note_record_2_current.id} created."
# note_record_3_current = NoteRecord.create!(
# 	note: notes[2],
# 	note_type: post_note_type
# )
# Rails.logger.info "NoteRecord #{note_record_3_current.id} created."
# note_record_4_pre = NoteRecord.create!(
# 	note: notes[3],
# 	note_type: pre_note_type
# )
# Rails.logger.info "NoteRecord #{note_record_4_pre.id} created."
# note_record_5_post = NoteRecord.create!(
# note: notes[4],
# note_type: post_note_type
# )
# Rails.logger.info "NoteRecord #{note_record_5_post.id} created."

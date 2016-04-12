class AddColumnApiIdMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :api_id, :integer, null: false
  end
end

class AddColumnApiIdMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :api_id, :string, null: false
  end
end

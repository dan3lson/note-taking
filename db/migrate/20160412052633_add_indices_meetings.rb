class AddIndicesMeetings < ActiveRecord::Migration
  def change
    add_index :meetings, :api_id
    add_index :meetings, :start_date
    add_index :meetings, :end_date
  end
end

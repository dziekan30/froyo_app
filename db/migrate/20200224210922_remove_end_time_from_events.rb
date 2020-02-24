class RemoveEndTimeFromEvents < ActiveRecord::Migration[6.0]
  def change

    remove_column :events, :end_time, :integer
  end
end

class AddColumnToContributions < ActiveRecord::Migration[5.0]
  def change
    add_column :contributions, :story_id, :integer
  end
end

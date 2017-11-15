class CreateContributions < ActiveRecord::Migration[5.0]
  def change
    create_table :contributions do |t|
      t.column :username, :string
      t.column :image, :string
      t.column :sentence, :string

      t.timestamps
    end
  end
end

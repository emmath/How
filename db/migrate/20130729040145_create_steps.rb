class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :description
      t.references :topic

      t.timestamps
    end
    add_index :steps, :topic_id
  end
end

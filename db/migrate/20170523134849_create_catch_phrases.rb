class CreateCatchPhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :catch_phrases do |t|
      t.belongs_to :student, foreign_key: true
      t.string :content
      t.string :mood
      t.boolean :suitable_for_work

      t.timestamps
    end
  end
end

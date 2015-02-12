class CreateQuestions < ActiveRecord::Migration
  def up
    create_table :questions do |t|
      t.integer :question_category_id
      t.text    :question
      t.text    :answer
      t.integer :position

      t.timestamps null: false
    end
  end

  def down
    drop_table :questions
  end
end

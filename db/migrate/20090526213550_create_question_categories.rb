class CreateQuestionCategories < ActiveRecord::Migration
  def up
    create_table :question_categories do |t|
      t.string  :name
      t.integer :position

      t.timestamps null: false
    end
  end

  def down
    drop_table :question_categories
  end
end

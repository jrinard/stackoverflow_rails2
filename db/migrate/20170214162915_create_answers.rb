class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :content
      t.integer :question_id
      t.integer :user_id
      t.integer :votes

      t.timestamps
    end
  end
end

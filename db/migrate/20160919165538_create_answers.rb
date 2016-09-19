class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :description, null: false
      t.belongs_to :question
      t.belongs_to :user

      t.timestamps
    end
  end
end

class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :details, null: false
      t.belongs_to :user 

      t.timestamps
    end
  end
end

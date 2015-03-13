class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string   :original
      t.boolean  :modified
      t.integer  :blank_count, default: 0
      t.belongs_to :deck

      t.timestamps
    end
  end
end

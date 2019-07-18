class CreateAuthorBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :author_blogs do |t|
      t.string :name

      t.timestamps
    end
  end
end

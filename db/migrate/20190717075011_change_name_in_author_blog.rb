class ChangeNameInAuthorBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :author_blogs, :first_name, :string
    add_column :author_blogs, :last_name, :string
    add_column :author_blogs, :nick_name, :string
    remove_column :author_blogs, :name
  end
end

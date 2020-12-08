class MigrateBodytoRichBodyBlogPosts < ActiveRecord::Migration[5.2]
  def up
    BlogPost.find_each do |article|
      article.update(rich_body: article.body)
    end
  end

  def down
    BlogPost.find_each do |article|
      article.update(body: article.rich_body)
      article.update(rich_body: nil)
    end
  end
end

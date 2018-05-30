class CreatePostsTable < ActiveRecord::Migration[5.2]
  def change 
    create_table :posts do |t|
      t.string :name
      t.string :body
      t.string :preview
      t.string :author_id
      t.string :tags
      
    end
  end
end

class RenamePostsContentToBody < ActiveRecord::Migration
  def change
  	rename_column :posts, :content, :body
  end
end

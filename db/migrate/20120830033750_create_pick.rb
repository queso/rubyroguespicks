class CreatePick < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.text :title
      t.text :link
      t.references :picker
    end
  end
end

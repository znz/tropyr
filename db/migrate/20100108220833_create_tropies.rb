class CreateTropies < ActiveRecord::Migration
  def self.up
    create_table :tropies do |t|
      t.string :pageid
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :tropies
  end
end

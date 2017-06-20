class UniqueCvrConstraint < ActiveRecord::Migration[5.0]
  def self.up
    add_index(:companies, :cvr, unique: true)
  end

  def self.down
    remove_index(:companies, :cvr)
  end
end

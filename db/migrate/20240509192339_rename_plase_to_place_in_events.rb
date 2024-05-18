class RenamePlaseToPlaceInEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :plase, :place
  end
end

class FixColumnNamesToTrainStations < ActiveRecord::Migration[7.1]
  def change
    rename_column :train_stations, :title, :name
    rename_column :train_stations, :content, :description
  end
end

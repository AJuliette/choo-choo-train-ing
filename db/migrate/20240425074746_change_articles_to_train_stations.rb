class ChangeArticlesToTrainStations < ActiveRecord::Migration[7.1]
  def change
    rename_table :articles, :train_stations
  end
end

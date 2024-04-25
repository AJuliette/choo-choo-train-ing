class TrainStation < ApplicationRecord
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
      .or(TrainStation.where('description LIKE ?', "%#{search}%"))
    else
      all
    end
  end
end

class Recommend < ApplicationRecord
  before_create :create_recommend

  private

  def create_recommend
    prefecture = Trip.find(6).prefecture
    spots = Spot.where(prefecture: "大阪府").pluck(:name)
    recommend = OpenAi.generate_recommend(prefecture, genre, spots)
    self.content = recommend
  end
end

class Recommend < ApplicationRecord
  before_create :create_recommend

  private

  def create_recommend
    spots = Spot.where(prefecture: prefecture).pluck(:name)
    recommend = OpenAi.generate_recommend(prefecture, genre, spots)
    self.content = recommend
  end
end

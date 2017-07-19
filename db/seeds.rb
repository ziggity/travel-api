class Seed

  def self.begin
    seed = Seed.new
    seed.generate_destinations
  end

  def generate_destinations
    20.times do |i|
      destination = Destination.create!(
      name: Faker::Address.street_name,
      country: Faker::Address.country,
      city: Faker::Address.city,
      rating: Faker::Number.between(1, 5)
      )

      2.times do |j|
        review = Review.create!(
          content: Faker::HarryPotter.quote,
          author: Faker::Name.first_name,
          destination_id: destination.id
        )
      end
    end
  end

end

Seed.begin

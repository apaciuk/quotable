20.times do
    Quote.create(name: Faker::Quote.famous_last_words)
end
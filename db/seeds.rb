venice = City.create!(
  user: User.find_by(email: "test1e@gmail.com"),
  name: "Venice",
  city_place_id: "517e26b15a4fab284059590e3edef5b74640f00101f901c5ae000000000000c0020792030e33303132312d33303137362b6974",
)

westbrook = City.create!(
  user: User.find_by(email: "test1e@gmail.com"),
  name: "Westbrook",
  city_place_id: "51a72a23e4729751c0596215ca1d91d64540f00101f9019505020000000000c0020792030830343039322b7573"
)

# output for testing the code
# puts "Venice created with ID: #{venice.id}" 
# puts "Westbrook created with ID: #{westbrook.id}"

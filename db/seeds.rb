# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
champs = [
    {
    name: "Garen Crownguard",
    age: 26,
    ability: "Demacian Justice",
    image: "./assets/images/garen.jpeg",
},
{
    name: "Katarina Du Couteau",
    age: 27,
    ability: "Death Lotus",
    image: "./assets/images/kat.png",
}
]

champs.each do |attributes|
  Champ.create attributes
  p "created champ #{attributes}" 
end

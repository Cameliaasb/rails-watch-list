# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require 'uri'
require 'net/http'

url = URI("https://tmdb.lewagon.com/movie/top_rated")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'

response = http.request(request)
response_json = JSON.parse(response.read_body)
data = response_json["results"]

data.each do |movie|
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url:movie["title"],
    rating: movie["vote_average"]
  )
end

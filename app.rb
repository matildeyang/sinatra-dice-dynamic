require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/dice/:number_of_dice/:how_many_sides") do
  @rolls = []
  # use the fetch method to get what the user inputs 
  # need to convert it to integer because it comes as a string
  @dice_num = params.fetch("number_of_dice").to_i
  @side_num = params.fetch("how_many_sides").to_i

  @dice_num.times do
    die = rand(1..@side_num)

    @rolls.push(die)
  end

  erb(:flexible)
end

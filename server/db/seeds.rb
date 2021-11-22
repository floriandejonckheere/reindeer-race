# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Finished Game
finished_game = Game.create!({
  start_date: 6.minutes.ago,
  end_date: 5.minutes.ago,
  status: :finished
})

ayrton = User.create!({
  name: "Ir. Ayrton"
})

Score.create!({
  colour: "red",
  score: 55,
  game_id: finished_game.id,
  user_id: ayrton.id
})

yannick_vdw = User.create!({
  name: "Yannick VDW"
})

Score.create!({
  colour: "blue",
  score: 45,
  game_id: finished_game.id,
  user_id: yannick_vdw.id
})

pieter_v = User.create!({
  name: "Pieter V"
})

Score.create!({
  colour: "green",
  score: 59,
  game_id: finished_game.id,
  user_id: pieter_v.id
})

jasper = User.create!({
  name: "Jaspeeeeer"
})

Score.create!({
  colour: "purple",
  score: 44,
  game_id: finished_game.id,
  user_id: jasper.id
})

# # Ongoing Game
# Game.create!{
#   start_date: 1.minute.ago,
#   status: :ongoing
# }


# Waiting Game
Game.create!


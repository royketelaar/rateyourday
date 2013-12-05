# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

scale = Scale.create([{scale: 'Vitaliteit'}, {scale: 'Toewijding'}, {scale: 'Absorptie'}])

question = Question.create([
  {question: 'Vandaag bruis ik van energie', scale_id: 1},
  {question: 'Ik voel me fit en sterk', scale_id: 1},
  {question: 'Vanochtend had ik zin om aan het werk te gaan', scale_id: 1},
  {question: 'Vandaag ben ik enthousiast over mijn werk', scale_id: 2},
  {question: 'Vandaag was ik trots op mijn werk', scale_id: 2},
  {question: 'Vandaag was ik geinspireerd aan het werk', scale_id: 2},
  {question: 'Vandaag ging ik helemaal op in mijn werk', scale_id: 3},
  {question: 'Vandaag heb ik genoten van mijn werk', scale_id: 3},
  {question: 'wanneer ik heel intensief aan het werk ben, voel ik mij gelukkig', scale_id: 3}
  ])


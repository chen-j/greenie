# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



saints = Scorer.create!(school_name: "St George's College", email: "stg@saints.com", password: "whatever", password_confirmation: "whatever")
falcon = Scorer.create!(school_name: "Falcon College", email: "falcon@falcon.com", password: "whatever", password_confirmation: "whatever")
johns = Scorer.create!(school_name: "St John's College", email: "johns@rams.com", password: "whatever", password_confirmation: "whatever")
house = Scorer.create!(school_name: "Peterhouse", email: "house@house.com", password: "whatever", password_confirmation: "whatever")


s1 = saints.matches.create!(teamAName:"Peterhouse Boys U15", teamBName:"St George's College U15", venue:"Peterhouse Boys", city: "Marondera", firstRef:"Peter Moore", secondRef:"Thomas James", matchdate:DateTime.new(2016,12,24,15,30), competition:"League Match", sport: "Rugby")
s2 = saints.matches.create!(teamAName:"Peterhouse Boys U15", teamBName:"St George's College U15", venue:"Peterhouse Boys", city: "Marondera", firstRef:"Peter Moore", secondRef:"Thomas James", matchdate:DateTime.new(2016,12,24,15,30), competition:"League Match", sport: "Hockey")
s3 = saints.matches.create!(teamAName:"Girls College 1st", teamBName:"Chisipite Senior 1st", venue:"Chisipite Senior School", city: "Harare", firstRef:"Peter Moore", secondRef:"Thomas James", matchdate:DateTime.new(2016,12,28,15,30), competition:"Bruce Kennedy Cup 2016", sport: "Water Polo")

f1 = falcon.matches.create!(teamAName:"Hellenic Academy U17", teamBName:"Falcon College U17", venue:"Falcon College", city: "Esigodhini", firstRef:"Peter Moore", secondRef:"Thomas James", matchdate:DateTime.new(2016,12,14,15,30), competition:"Bruce Kennedy Cup 2016", sport: "Water Polo")
f2 = falcon.matches.create!(teamAName:"St John's College U14", teamBName:"Peterhouse Boys U14", venue:"St John's College", city: "Harare", firstRef:"Peter Moore", secondRef:"Thomas James", matchdate:DateTime.new(2016,12,17,15,30), competition:"Exhibition", sport: "Basketball")
f2 = falcon.matches.create!(teamAName:"Chisipite Senior U17", teamBName:"Hellenic Academy U17", venue:"Hellenic Academy", city: "Harare", firstRef:"Peter Moore", secondRef:"Thomas James", matchdate:DateTime.new(2017,1,13,19,30), competition:"Crusaders Shield 2017", sport: "Football")

j1 = johns.matches.create!(teamAName:"Peterhouse Boys 1st", teamBName:"Prince Edward School 1st", venue:"Falcon College", city: "Esigodhini", firstRef:"Peter Moore", secondRef:"Thomas James", matchdate:DateTime.new(2017,2,2,14,30), competition:"Crusaders Shield 2017")
j2 = johns.matches.create!(teamAName:"St John's College 1st", teamBName:"St George's College 1st", teamAScore: 8, teamBScore: 10, matchStatus: "completed", venue:"Falcon College", city: "Esigodhini", firstRef:"Peter Moore", secondRef:"Thomas James", matchdate:DateTime.new(2016,1,28,8,30), competition:"Friendly")
j3 = johns.matches.create!(teamAName:"Girls College 1st", teamBName:"Peterhouse Girls 1st", teamAScore: 4, teamBScore: 1, matchStatus: "completed", venue:"Falcon College", city: "Esigodhini", firstRef:"Peter Moore", secondRef:"Thomas James", matchdate:DateTime.new(2016,4,2,10,30), competition:"Friendly")

h1 = house.matches.create!(teamAName:"Prince Edward School U17", teamBName:"St John's College U17", teamAScore: 18, teamBScore: 10, matchStatus: "completed", venue:"Falcon College", city: "Esigodhini", firstRef:"Peter Moore", secondRef:"Thomas James", matchdate:DateTime.new(2016,3,21,12,30), competition:"Friendly")
h2 = house.matches.create!(teamAName:"Chisipite Senior School 1st", teamBName:"Hellenic Academy Girls 1st", teamAScore: 12, teamBScore: 3, matchStatus: "completed", venue:"Hellenic Academy", city: "Harare", firstRef:"Peter Moore", secondRef:"Thomas James", matchdate:DateTime.new(2016,3,22,15,30), competition:"Friendly")
h3 = house.matches.create!(teamAName:"Falcon College U15", teamBName:"Christian Brothers U15", teamAScore: 5, teamBScore: 6, matchStatus: "completed", venue:"Christian Brothers College", city: "Bulawayo", firstRef:"Peter Moore", secondRef:"Thomas James", matchdate:DateTime.new(2016,4,22,18,30), competition:"Friendly")

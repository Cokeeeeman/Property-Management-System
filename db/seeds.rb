# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Guest.create!(name:  "Ziyue Chen", email: "ziyuechen@yahoo.com")
Guest.create!(name:  "Yuwei Liang", email: "fredcorn@gmail.com")
Guest.create!(name:  "Yanbo Hao", email: "khao@holidale.com")
Guest.create!(name:  "Meng Cao", email: "mengcao@gmail.com")
Guest.create!(name:  "Xuan Yao", email: "xuanyao@qq.com")
Guest.create!(name:  "Jinping Xi", email: "jingping@sina.com")
Guest.create!(name:  "Kobe Bryant", email: "kobe@nba.com")


Room.create!(name: "2400 Naples", guest_id: 2)
Room.create!(name: "100 Bayarea", guest_id: 1)
Room.create!(name: "56 Tomorrow Land", guest_id: 4)
Room.create!(name: "652 Baypoint", guest_id: 3)
Room.create!(name: "6 Wooden Bridge", guest_id: 7)
Room.create!(name: "210 Central Park" )
Room.create!(name: "72 Turtle Rock")


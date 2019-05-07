# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

option_type = OptionType.create name: 'color', presentation: 'Color'

OptionValue.create(option_type: option_type, name: 'Red', presentation: 'Red')
OptionValue.create(option_type: option_type, name: 'Pink', presentation: 'Pink')
OptionValue.create(option_type: option_type, name: 'Orange', presentation: 'Orange')

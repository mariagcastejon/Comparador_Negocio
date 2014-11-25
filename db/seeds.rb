# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Country.create([
	{name: 'Panama', 
		idh: 7, 
		impuesto_apertura: 10, 
		impuesto_sociedades: 7, 
		precio_medio_plato: 32},

	{name: 'España', 
		idh: 10, 
		impuesto_apertura: 15, 
		impuesto_sociedades: 11, 
		precio_medio_plato: 90},

	{name: 'EEUU',
		idh: 9, 
		impuesto_apertura: 12, 
		impuesto_sociedades: 35, 
		precio_medio_plato: 51}])

















# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

Project.create  name: 'Genoma humano', description: 'Creación de un sistema para vectores genéticos.', estimated_budget: 15630.45, is_strategic: true 
Project.create  name: 'Galápago Guns', description: 'Creación de un sistema para vectores genéticos.', estimated_budget: 6630.45, is_strategic: true 
Project.create  name: 'Domótica de la ciudad', description: 'Creación de un sistema para vectores genéticos.', estimated_budget: 2630.45, is_strategic: true 
Project.create  name: 'Urbótica de Yachay', description: 'Urbótica para edificios.', estimated_budget: 55630.45, is_strategic: false 
Project.create  name: 'Supercomputador', description: 'Supercomputador matemático.', estimated_budget: 115630.45, is_strategic: true 
Project.create  name: 'Genoma humano I', description: 'Creación de un sistema para vectores genéticos I.', estimated_budget: 630.45, is_strategic: true 
Project.create  name: 'Galápago Guns I', description: 'Supuestamente vamos a destruir al mundo.', estimated_budget: 8630.45, is_strategic: true 
Project.create  name: 'Domótica de la ciudad I', description: 'Domótica para casitas.', estimated_budget: 555630.45, is_strategic: false 
Project.create  name: 'Supercomputador I', description: 'Supercomputador matemático I.', estimated_budget: 566730.45, is_strategic: true 
Project.create  name: 'Hongos alucinógenos', description: 'Rastreo de hongos en el Ecuador.', estimated_budget: 10630.45, is_strategic: true 
Project.create  name: 'Sistema Académico', description: 'Creación de un sistema académico.', estimated_budget: 6630.45, is_strategic: false 


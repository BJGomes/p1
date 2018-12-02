# README

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/d918765b49564d0aa170d71ca5541a3d)](https://www.codacy.com/app/BJGomes/p1?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=BJGomes/p1&amp;utm_campaign=Badge_Grade)

## Description
	This application is developed using Ruby on Rails full stack and with postgres10.5 as the dbms.
	Both, the RoR and the database are running in separate docker containers.

## * Ruby version
	ruby 2.5.1

## * System dependencies
	Besides the usual RoR dependencies some aditional gems where included in this project:
		gem 'devise' -> for user authentication
		gem 'bootstrap-sass' -> for bootstrap frontend style framework integration
		gem 'jquery-rails' -> for jquery integration
		gem 'pagy', '~> 0.21.0' -> for an efficient way of table pagination 
		gem 'best_in_place', '~> 3.0.1' -> for in place editing of data tables
		gem 'geocoder' -> used to get the map coordinates based on a simple address
		gem 'gmaps4rails' -> for google map integration

## * Requirements
	This application requires a machine running docker.
	
## * Installation / Usage
	To get the system up and running just open the terminal on the project root folder and type:
	
		docker-compose up --build
		
	Then just open a webbrowser in the following link:
	
		localhost:3000

## * Uninstalation
	docker-compose down --rmi all --volume

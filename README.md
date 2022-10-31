# MARKETPLACE ASSIGNMENT - App

This is the front-end, cross-platform (works on both iOS and Android) part of the assignment #2 regarding the implementation of the Marketplace application.


## Getting Started

In order to run this project you will need Flutter v2.5.3 (channel stable). 

Steps:
- Load the DB
- Start the node.js server from github/GiulioFischietti/assignment2_marketplace_backend
- Open the project with your IDE and update the host (192.168.x.x) to "192.168.1.109" in order to execute correctly the queries to your local db
- Run inside lib the following commands: flutter pub get, flutter run

## Project Structure
The Flutter project has the following structure:
- repository: classes that perform http requests to the backend
- model: classes used to model the various enetities (User, Customer, Monitor, Product...) used in the app
- widgets: classes regarding the graphical repeatable components in the app
- screens: classes regarding the pages of the app


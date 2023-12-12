# Flutter Car Rental App.

## Description

The Flutter Car Rental App is a mobile application that allows users to browse and rent cars. <br>
Users can view details about each car, including images and characteristics, and rent their chosen vehicles.

## Technologies Used

- Flutter
- Firebase (Firestore and Authentication)
- Provider for state management

## Installation

To run this project locally, follow these steps:

1. Clone the repository.
2. Navigate to the project directory.
3. Install dependencies: flutter pub get
4. Run the app: flutter run

##Usage
Login page connected to the Firebase Auth:
From this page user can login.
Here is the "invalid credentials" message will appear if the email or pass is incorrect.
If the user don't have and account, should use the registration button.

![invalidcred](https://github.com/EB-coder/Car_renting_flutter/assets/73636880/ebbfd8f6-3aa3-4d6a-bbb4-3a35364b1bac)

#This is the Registration page:
On this page user need to enter his email, pass and also confirm it, if the password is not match, the "pass not match" error appear.

![registermatchpass](https://github.com/EB-coder/Car_renting_flutter/assets/73636880/b18a0ebd-2a55-4835-91f1-302fc65deeeb)

#Browse the list of available cars.
This page is wall where the cars will be presented from the Firebase.

![main wall](https://github.com/EB-coder/Car_renting_flutter/assets/73636880/676b9d0b-9dd0-4248-a480-4bb24b1c3702)

View details of each car by pressing the "Show" button.
And there will be a button to rent the car.

![show_details](https://github.com/EB-coder/Car_renting_flutter/assets/73636880/33fda28a-1578-46ba-9e48-c66740068d77)

Rent a car by pressing the "Rent this car" button.
Here is the confirmation window will appear.

![areushure](https://github.com/EB-coder/Car_renting_flutter/assets/73636880/a6b9ab89-2be1-4396-97be-d3138531e395)
6ffbca)

Access your rented cars in the "My Cars" section.

![My_cars](https://github.com/EB-coder/Car_renting_flutter/assets/73636880/ca06fbf1-1923-4d7d-be68-07c574041258)

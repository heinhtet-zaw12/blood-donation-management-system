# blood_donation_management_system

A Flutter mobile application that helps manage blood donations, donor records, and appointment scheduling.  
The app allows users to request blood, donate blood, and track donation history.


##  Architecture

This project follows Clean Architecture principles:

- Presentation Layer (UI)
- State Management (Riverpod)
- Repository Layer
- Data Source (API integration using DIO)
- Result Pattern for handling success and failure cases

- 📂 Project Structure
lib/
 ├── core/
 │    ├── theme/        
 │    ├── utils/       
 │    ├── widgets/      
 │    ├── storage/      
 │    ├── routes/      
 │    ├── result/       
 │    └── constants/    
 │
 ├── features/
 │    ├── authentication/   
 │    ├── dashboard/        
 │    ├── profile/         
 │    ├── appointment/      
 │    └── donor/           

## Features
- User Authentication (Login / Register)
- Blood Donation Request
- Donor Profile Management
- Appointment Scheduling
- Medical Record Tracking
- Responsive UI built with Flutter

 ## Tech Stack
- Flutter
- Dart
- Riverpod
- Dio
- GoRouter
- flutter-secure-storage

  ##  API Integration

- RESTful API integration using Dio
- Token-based authentication
- Secure API requests with Authorization headers
- Error handling using Result pattern


🚀 Getting Started
git clone https://github.com/heinhtet-zaw12/blood-donation-management-system.git
cd blood-donation-management-system
flutter pub get
flutter run

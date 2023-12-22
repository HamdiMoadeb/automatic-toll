# TollXpress - TOGO

Mobile application using [Flutter](https://flutter.dev/) as an automatic toll system for Soroubat - TOGO.

## Installation

Follow the [Get Started](https://docs.flutter.dev/get-started/install) guide to install Flutter.


## Tools and Dependencies

Ensure you have the following tools and dependencies installed before running the project:

* [Flutter SDK](https://docs.flutter.dev/get-started/install) v3.16.0
* [Dart SDK](https://dart.dev/get-dart) v3.2.0
* [flutter_bloc](https://pub.dev/packages/flutter_bloc) v8.1.3  (State management)
* [bloc](https://pub.dev/packages/bloc) v8.1.2  (State management)
* [equatable](https://pub.dev/packages/equatable) v2.0.5  (Simplify Equality Comparisons)
* [get_it](https://pub.dev/packages/get_it) v7.6.4  (Service Locator)
* [dartz](https://pub.dev/packages/dartz) v0.10.1  (Functional programming)
* [http](https://pub.dev/packages/http) v1.1.2  (HTTP requests)
* [google_maps_flutter](https://pub.dev/packages/google_maps_flutter) v2.5.0  (Google Maps widget)
* [shared_preferences](https://pub.dev/packages/shared_preferences) v2.2.2  (Persistent storage)
* [lottie](https://pub.dev/packages/lottie) v2.7.0  (After Effects animations)
* [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator) v1.1.0  (Page indicator)



## Overview
* **Clean Architecture:** The project follows the Clean Architecture pattern to ensure separation of concerns and maintainability.
* **Domain Layer:** Contains the business logic and entities of the application.
* **Data Layer:** Manages data sources, repositories, and data models.
* **Presentation Layer:** Handles UI components, state management, and user interactions.


## Project Structure
```
lib/
|-- core/
|   |-- errors/
|   |-- usecase/
|   |-- services/
|   |-- utils
|
|
|-- features/
|   |
|   |-- feature-name
|   |
|       |-- data/
|           |-- datasources/
|           |-- repositories/
|           |-- models/
|
|       |-- domain/
|           |-- entities/
|           |-- repositories/
|           |-- usecases/
|
|       |-- presentation/
|           |-- pages/
|           |-- widgets/
|           |-- blocs/
|
|-- main.dart
```
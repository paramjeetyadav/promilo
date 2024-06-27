# Flutter Project

## Overview
This Flutter project is structured to ensure clean code architecture and efficient state management. It leverages the `Provider` package for state management, `Go Router` for navigation with shell routes for a bottom navigation bar, and the `http` package for network services.

## Project Structure
The project is organized into four main folders under the `lib` directory:

### 1. Infrastructure
The `infrastructure` folder contains:
- **Constants files**: Define constants used throughout the application.
- **HTTP Service files**: Manage network requests and API interactions.
- **Common Utils**: Utility functions and classes that are commonly used across the application.

### 2. Model
The `model` folder contains:
- **Data Models**: Defines the data model for the login response and other data structures used in the app.

### 3. Domain
The `domain` folder contains:
- **ViewModel files**: Contains business logic and state management using the `Provider` package.

### 4. Presentation
The `presentation` folder contains:
- **Widgets**: Common widgets used across different screens.
- **Screens**: All the UI screens of the application.

## State Management
The project uses the `Provider` package for state management. Providers are used to manage the state of the application and to make it available throughout the widget tree.

## Routing
The project uses `Go Router` for handling navigation. Shell routes are implemented for the bottom navigation bar to manage navigation within the app efficiently.

## Networking
The `http` package is used for network services to handle API requests and responses.


<h1>RentMate (WIP Project)</h1>
Learning Flutter while building a project



> Note: These docs are subjected to changes as the project progress

<h1>Table of Contents</h1>

- [Objectives of the Project](#objectives-of-the-project)
- [Intended Project Structure](#intended-project-structure)
- [Explanation of the Structure](#explanation-of-the-structure)
  - [Why This Structure?](#why-this-structure)


## Objectives of the Project
<details>
<summary>Click to expand</summary>

- To develop a badge system where users can earn badge for achievements and legitimacy by providing legal document like business registration certificate to the platform.
- To develop a monitoring system for usage of rental items that monitors equipment usage beyond agreed rental terms and push notifications accordingly. Renters can request rental extensions directly within the app if needed, allowing both the owner and renter to agree on an extended rental period with updated pricing.
- To incorporate built-in chat with canned responses and push notification features within the application to facilitate seamless communication between users and ensure timely updates regarding rental transactions, price drops, warnings, achievements etc.
- To develop a filter mechanism so that users can find products to rent easily.  Users can also "favorite" or save items they’re interested in renting for later. This could be as simple as adding a heart or bookmark icon next to listings.

</details>

## Intended Project Structure
<details>
<summary>Click to expand</summary>

```
lib/
│
├── main.dart                     # App entry point
│
├── core/                         # Core functionalities used throughout the app
│   ├── constants/                # App-wide constants (e.g., colors, strings, keys)
│   ├── services/                 # Global services (Firebase, Notifications, API clients)
│   ├── utils/                    # Utility classes (helpers, formatters, extensions)
│   └── error/                    # Error handling (e.g., custom exceptions, failure classes)
│
├── data/                         # Data layer (handles all data sources)
│   ├── datasources/
│   │   ├── remote/               # Remote data sources (API calls)
│   │   └── local/                # Local data sources (Hive, SQLite)
│   ├── models/                   # Data models (DTOs - Data Transfer Objects)
│   ├── repositories/             # Repository implementations
│   └── providers/                # API clients, interceptors, etc.
│
├── domain/                       # Domain layer (business logic)
│   ├── entities/                 # Core business entities (e.g., User, RentalItem)
│   ├── repositories/             # Abstract repository interfaces
│   └── usecases/                 # Business logic use cases (e.g., FetchRentals, ExtendRental)
│
├── features/                     # Features modularized for scalability
│   ├── auth/                     # Authentication feature
│   │   ├── screens/              # Auth UI screens (login, register)
│   │   ├── widgets/              # Auth-specific reusable widgets
│   │   ├── cubit/                # State management for Auth (flutter_bloc)
│   │   └── services/             # Auth services (login, register)
│   │
│   ├── chat/                     # Chat feature (built-in messaging)
│   │   ├── screens/              # Chat screens (chat UI)
│   │   ├── widgets/              # Reusable chat widgets
│   │   ├── cubit/                # State management for chat
│   │   ├── models/               # Chat-related data models
│   │   └── services/             # Services for managing chat messages
│   │
│   ├── rental/                   # Rental feature (monitoring, rental items, extensions)
│   │   ├── screens/              # Rental UI screens
│   │   ├── widgets/              # Reusable rental widgets (filters, cards)
│   │   ├── cubit/                # State management for rentals
│   │   ├── models/               # Data models for rental items
│   │   └── services/             # Services (rental extension, notifications)
│   │
│   ├── profile/                  # User profile (badges, achievements)
│   │   ├── screens/              # Profile screens (view/edit profile, badges)
│   │   ├── widgets/              # Profile-specific widgets (badge display)
│   │   ├── cubit/                # State management for profile
│   │   ├── models/               # Models for user profile and badges
│   │   └── services/             # Services for handling profile-related logic
│   │
│   ├── notifications/            # Notifications feature
│   │   ├── services/             # Services for push/local notifications
│   │   └── models/               # Data models for notifications
│   │
│   └── search_filter/            # Search and filter feature
│       ├── widgets/              # Search bars, filters, and UI components
│       ├── cubit/                # State management for search/filter logic
│       └── services/             # Filter logic helpers, use cases
│
├── shared/                       # Shared utilities/widgets used across features
│   ├── widgets/                  # Global reusable widgets (e.g., buttons, inputs)
│   ├── components/               # Smaller shared UI components (e.g., loaders)
│   └── styles/                   # Common styling utilities (e.g., app-wide margins, paddings)
│
├── routes/                       # App-wide route management using GoRouter
│   ├── app_routes.dart           # Route definitions for the app
│   └── route_guard.dart          # Guards for protected routes (e.g., auth checks)
│
├── theme/                        # App-wide themes
│   ├── app_theme.dart            # Main theme data (light/dark theme)
│   └── color_schemes.dart        # Custom color schemes
│
└── dependency_injection/         # Dependency injection setup (GetIt)
    └── service_locator.dart      # Registers repositories, services, use cases

```
</details>

## Explanation of the Structure
<details>
<summary>Click to expand</summary>

### Why This Structure?

- Modular: Each feature is encapsulated and self-contained. You can easily add, remove, or modify features without breaking other parts of the app.
- Scalable: If you want to add more features in the future (e.g., payments, analytics), you can simply create a new folder under features/.
- Clean Architecture: Clear separation of concerns into data, domain, and presentation layers.
- Reusability: Shared widgets and components can be reused across features, reducing code duplication.
- Maintainability: Organized structure ensures that developers (including you) can navigate and manage the project easily.

</details>

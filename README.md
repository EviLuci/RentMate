<h1>RentMate (WIP Project)</h1>
Learning Flutter while building a project


<h1>Table of Contents</h1>

- [Objectives of the Project](#objectives-of-the-project)
- [Intended Project Structure](#intended-project-structure)
- [Explanation of the Structure](#explanation-of-the-structure)


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
├── core/
│   ├── constants/                # App-wide constants (e.g., color schemes, strings)
│   ├── services/                 # Reusable services (e.g., Firebase services, API integrations)
│   ├── utils/                    # Utility classes (helpers, formatters, etc.)
│   └── models/                   # Data models (e.g., User, RentalItem)
│
├── data/
│   ├── repositories/             # Data repositories (for abstracting data sources)
│   └── providers/                # Firebase, API providers (for interacting with Firestore, etc.)
│
├── features/
│   ├── auth/                     # Authentication feature (login, registration)
│   │   ├── screens/              # Auth-related UI screens (login, register)
│   │   └── widgets/              # Auth-specific widgets (e.g., forms, buttons)
│   ├── chat/                     # Chat feature (chat UI, message sending)
│   │   ├── screens/              # Chat-related UI screens
│   │   ├── models/               # Chat-related data models (Message, Conversation)
│   │   └── services/             # Chat-related services (send/receive messages)
│   ├── rental/                   # Rental item listing, management
│   │   ├── screens/              # Rental item screens (listings, item details)
│   │   ├── models/               # Rental-related models (RentalItem, RentalTransaction)
│   │   ├── services/             # Rental services (rental extensions, monitoring)
│   │   └── widgets/              # Reusable rental-related widgets (cards, filters)
│   ├── profile/                  # User profile, badges, achievements
│   │   ├── screens/              # Profile screens (view profile, edit profile)
│   │   ├── models/               # Profile-related models (UserProfile, Badge)
│   │   └── widgets/              # Profile-related widgets (badge display, user info)
│   └── notifications/            # Notifications (push notifications setup, management)
│       ├── services/             # Notification services (push notifications)
│       └── models/               # Notification models (NotificationItem)
│
├── widgets/                      # Shared widgets (e.g., buttons, form fields)
├── routes/                       # App-wide route management (for navigation)
└── theme/                        # App-wide theme and styling (colors, fonts, etc.)

```
</details>

## Explanation of the Structure
<details>
<summary>Click to expand</summary>

1. core/: Contains core parts of the application like constants (for colors, strings), services, utility classes, and shared models (data structures).

    - constants/: Store all app-wide constants here (e.g., color schemes, string literals).
    - services/: These are global services like Firebase, API clients, etc. (e.g., AuthService, FirebaseStorageService).
    - models/: Global data models that don’t belong to specific features (e.g., User, RentalItem).

2. data/: Contains all data-related logic such as repositories and providers.

    - repositories/: Abstracts away data-fetching logic and interactions with APIs, databases, etc. (useful if switching between different data sources).
    - providers/: Houses your Firebase or REST API interactions.

3. features/: This folder is the heart of your app, where each core feature (or module) is managed. Each feature should have its own folder for screens, widgets, models, and services. This allows features to be self-contained and modular:

    - auth/: For user authentication-related screens (login, signup), forms, etc.
    - chat/: For chat-related functionalities such as sending messages, chat UI, and chat services.
    - rental/: For rental items, rental agreements, extensions, and filtering functionality.
    - profile/: For managing user profiles, badges, and achievements.
    - notifications/: To manage push notifications and local notifications.

4. widgets/: For shared or reusable UI components that are used across different features or modules (e.g., buttons, form inputs, loaders).

5. routes/: Centralized routing system to manage navigation across screens, using named routes.

6. theme/: Contains all app-wide styles such as colors, fonts, and other theme-related settings.

</details>
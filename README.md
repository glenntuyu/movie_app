# Movie App

Movie App is an application developed using Flutter that provides a Movie Database App designed using Clean Architecture principles. It contains features such as home screen with infinite scrolling showing Top Rated Movies and a list of Cinema (Mockk), movie detail information with Youtube trailer, map location for each Cinema with current Location, map location for all cinema, and reminder notification.

## Features

1. **Home Page**
   - Displays list of Cinema. (Data is Mockked)
   - Displays list of Top Rated Movies. (Infinite Scroll)
   - Reminder Notification Button.

2. **Movie Details**
   - Provides detailed information about a selected movie.
   - Includes an embedded YouTube trailer for preview.

3. **Cinema Location**
   - Provide a map that shows Cinema location and current location.
   - Shows ETA from current location to Cinema location. (WIP: Development will use Distance Matrix API from Google API)

4. **All Cinema Location**
   - Shows all Cinema location at once.

## Tech Stacks

1. **Clean Architecture**
Create a separation of concern between layers into presentation, domain, and data for a modular and scalable codebase.
   - **Presentation Layer**: Contains UI components and presentation logic.
   - **Domain Layer**: Defines use cases and business logic independent of UI.
   - **Data Layer**: Manages data sources, repositories, and external services.

2. **Bloc**
   - A state management that helps to separate presentation layer from business logic.

3. **Isolate for JSON Parsing**
   - Efficiently parses JSON data using isolates for better performance.

4. **Lottie Animation**
   - Enhances user interface with Lottie animations for a visually appealing experience.
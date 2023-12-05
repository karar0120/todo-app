# Todo App

A simple Flutter application for managing todos with CRUD operations.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Project Structure](#project-structure)

## Introduction

Welcome to the Todo App! This Flutter application allows users to create, read, update, and delete todo items. The focus is on providing an intuitive and visually appealing interface for managing tasks efficiently.

## Features

- List all todos
- Create a new todo
- Update an existing todo
- Delete a todo
- Optimistic UI updates for a smoother user experience

## Getting Started

### Prerequisites

Make sure you have Flutter and Dart installed on your machine. If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/karar0120/todo-app-flutter.git
    cd todo-app-flutter
    ```

2. Install dependencies:

    ```bash
    flutter pub get
    ```

3. Run the app:

    ```bash
    flutter run
    ```

## Project Structure

    .
    ├── core                       # For all common and core files.
    │   ├── error                  # contains all Exceptions and Failures classes
    │   ├── presentation           # Common presentation files
    |   │   └── blocs              # Common blocs
    |   │   └── pages              # Core pages
    |   │   └── widgets            # Common widgets
    │   └── route                  # Routes for navigation
    │   └── theme                  # Theme data
    │   └── usecases               # Common usecases
    |
    ├── data                       # Data Files of Feature 1
    │   ├── datasources            # DataSources Abstract Files and Implementations
    │   │   └── feature            # Feature 1 (for exp : Todo Feature)
    │   │       └── sub-feat.      # Sub feature
    │   ├── models                 # Models for data
    │   │   └── feature            # Feature 1 (for exp : Todo Feature)
    │   │       └── sub-feat.      # Sub feature
    │   └── repositories           # Repositories Implementation Classes
    │       └── feature            # Feature 1 (for exp : Todo Feature)
    │           └── sub-feat.      # Sub feature
    ├── domain                     # Domain
    │   ├── entities               # Entities For Feature 1
    │   │   └── feature            # Feature 1 (for exp : Todo Feature)
    │   │       └── sub-feat.      # Sub feature
    │   ├── usecases               # Usecases of Feature 1
    │   │   └── feature            # Feature 1 (for exp : Todo Feature)
    │   │       └── sub-feat.      # Sub feature
    │   └── repositories           # Repositories Abstract Classes
    │       └── feature            # Feature 1 (for exp : Todo Feature)
    │           └── sub-feat.      # Sub feature
    └── presentation               # Presentation files
        ├── blocs                  # Blocs
        │   └── feature            # Feature 1 (for exp : Todo Feature)
        │       └── sub-feat.      # Sub feature
        ├── pages                  # Pages
        │   └── feature            # Feature 1 (for exp : Todo Feature)
        │       └── sub-feat.      # Sub feature
        └── widgets                # Widgets
            └── feature            # Feature 1 (for exp : Todo Feature)
                └── sub-feat.      # Sub feature

## Architecture

This app uses [***Clean Architecture by Robert C Martin***]

<img src="https://github.com/ResoCoder/flutter-tdd-clean-architecture-course/blob/master/architecture-proposal.png" style="display: block; margin-left: auto; margin-right: auto; width: 75%;"/>

Image Source : [ResoCoder](https://resocoder.com)

## Branches

    .
    ├── master                       # Contains the latest release
           ├── dev                   # Contains the latest development
                ├── feature1         # feature 1 created from dev
                ├── feature2         # feature 2 created from dev
                ├── feature3         # feature 3 created from dev
                ├── bugFix1          # bugfix 1 created from dev
                ├── bugFix2          # bugfix 1 created from dev
                ├── docChange1       # docChange 1 created from dev
                ├── docChange1       # docChange 2 created from dev
                
# :iphone: Screens
 ## :house: All Todos
 - Used caching mechanism to store and retreive data from local storage.
![WhatsApp Image 2023-12-05 at 10 33 27_70bd1ee2](https://github.com/karar0120/chat/assets/92108624/7ebfd62c-8ead-4260-9d1f-0b1d23df4d3a)

![Screenshot_2023_12_05_09_01_06_20_e03bf8c468d3e61880c2a4883953e9f6](https://github.com/karar0120/chat/assets/92108624/d714d049-8aeb-47c5-b431-ab18bf21a80d)

## ➕ Add Todo

![Screenshot_2023_12_05_09_01_18_51_e03bf8c468d3e61880c2a4883953e9f6](https://github.com/karar0120/chat/assets/92108624/2b850959-0a61-4e28-a77e-02d9131a7fcc)

- Validation data in all text form field.

![Screenshot_2023_12_05_09_01_21_71_e03bf8c468d3e61880c2a4883953e9f6](https://github.com/karar0120/chat/assets/92108624/4aea30df-1e17-42bb-95f4-10b0d64d3d3b)

## 🔨 Edit Todo 
![Screenshot_2023_12_05_09_01_13_71_e03bf8c468d3e61880c2a4883953e9f6](https://github.com/karar0120/chat/assets/92108624/a005e0d2-36b4-4d4c-a914-05da6e89d6f5)

## ❎ Delete Todo
![Screenshot_2023_12_05_09_01_26_63_e03bf8c468d3e61880c2a4883953e9f6](https://github.com/karar0120/chat/assets/92108624/948e05dc-cf29-4c8d-b52e-ecb0a41e7e1c)

- Add confirmation message to check need to delete or not

![Screenshot_2023_12_05_09_01_29_57_e03bf8c468d3e61880c2a4883953e9f6](https://github.com/karar0120/chat/assets/92108624/91336eeb-52b2-481c-9010-a73fcc42e499)

- Show a confirmation pop up to display successful message after add , edit ,delete

![Screenshot_2023_12_05_09_01_53_01_e03bf8c468d3e61880c2a4883953e9f6](https://github.com/karar0120/chat/assets/92108624/0b717ea4-2525-41ce-86e0-c4fd88be8d71)


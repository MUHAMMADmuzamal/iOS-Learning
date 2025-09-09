#  Screaming Folder Structure

ExpenseTracker/
│
├── App/                       // App-level setup, navigation, DI
│   ├── MainApp.swift
│   ├── AppCoordinator.swift
│   └── Splash/                // Temporary UI-only stuff
│       ├── SplashView.swift
│       └── SplashViewModel.swift
│
├── Features/                  // <-- Screaming here (business features)
│   ├── Transactions/          // "Home" actually shows transactions
│   │   ├── Presentation/      // SwiftUI / UIKit, ViewModels
│   │   ├── Domain/            // UseCases, Entities, Protocols
│   │   └── Data/              // Repository implementations, mappers
│   │
│   ├── Wallet/                // Wallet-related screens + logic
│   │   ├── Presentation/
│   │   ├── Domain/
│   │   └── Data/
│   │
│   ├── Statistics/            // Reports, charts, history
│   │   ├── Presentation/
│   │   ├── Domain/
│   │   └── Data/
│   │
│   └── Profile/               // User info, settings
│       ├── Presentation/
│       ├── Domain/
│       └── Data/
│
├── Shared/                    // Reusable cross-feature components
│   ├── UI/                    // Buttons, custom navbars
│   ├── Services/              // Firebase, CoreData, Networking
│   ├── Utils/                 // Formatters, Extensions
│   └── Models/                // Generic shared models
│
└── Resources/                 // Assets, Strings, Colors


📂 Generic Folder Structure

App/
 ├── AppDelegate.swift
 ├── SceneDelegate.swift
 ├── AppCoordinator.swift          // Root navigation
 ├── AppDIContainer.swift          // Dependency Injection
 ├── Configuration/                // App configs, envs
 │    ├── AppConfig.swift
 │    └── Environment.swift
 ├── Resources/                    // Fonts, Colors, Assets
 │    ├── Assets.xcassets
 │    ├── Colors.swift
 │    └── Fonts.swift
 └── Theme/                        // Global appearance
      ├── AppTheme.swift
      └── AppAppearance.swift


Features/
 └── Transactions/                 // Feature = business capability
      ├── Presentation/             // UI Layer
      │    ├── List/
      │    │    ├── TransactionListView.swift
      │    │    ├── TransactionListViewModel.swift
      │    │    └── TransactionListViewModelProtocol.swift
      │    ├── Add/
      │    │    ├── AddTransactionView.swift
      │    │    ├── AddTransactionViewModel.swift
      │    │    └── AddTransactionViewModelProtocol.swift
      │    └── Edit/
      │         ├── EditTransactionView.swift
      │         ├── EditTransactionViewModel.swift
      │         └── EditTransactionViewModelProtocol.swift
      │
      ├── Domain/                   // Business Rules
      │    ├── Entities/
      │    │    └── Transaction.swift
      │    ├── UseCases/
      │    │    ├── AddTransactionUseCase.swift
      │    │    ├── EditTransactionUseCase.swift
      │    │    └── ListTransactionsUseCase.swift
      │    └── Repositories/
      │         ├── TransactionRepository.swift (protocol)
      │
      └── Data/                     // Data Layer (implementations)
           ├── CoreData/
           │    └── CoreDataTransactionRepository.swift
           ├── Firebase/
           │    └── FirebaseTransactionRepository.swift
           └── InMemory/
                └── InMemoryTransactionRepository.swift


Shared/
 ├── UIComponents/                 // Reusable UI elements
 │    ├── PrimaryButton.swift
 │    ├── CustomTextField.swift
 │    ├── LoadingView.swift
 │    └── NavigationBar.swift
 │
 ├── Services/                      // Shared services (system / 3rd party)
 │    ├── HttpClient.swift
 │    ├── UserDefaultsService.swift
 │    └── FirebaseService.swift
 │
 ├── Utils/                         // General helpers
 │    ├── DateFormatter.swift
 │    ├── NumberFormatter.swift
 │    └── Logger.swift
 │
 └── Extensions/                    // Extensions
      ├── String+Validation.swift
      ├── Date+Format.swift
      └── View+Modifiers.swift



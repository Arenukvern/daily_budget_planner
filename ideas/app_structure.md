# Flutter Project Structure Guide

## Directory Organization

### Core Layers

- `data_models/` - Domain entities and data structures
- `data_states/` - State management and business logic
- `data_services/` - Service layer implementations
- `data_local_api/` - Local storage and API implementations
- `core/` - Core utilities and shared functionality

### UI Layers

- `ui_kit/` - Reusable UI components and design system
- `ui_*` directories - Feature-specific UI implementations
  - Each feature module is isolated in its own directory
  - Example: `ui_home/`, `ui_account/`, `ui_prediction/`

### Application Layer

- `di/` - Dependency injection and service locator
- `router.dart` - Navigation and routing configuration
- `common_imports.dart` - Shared imports and constants
- `envs.dart` - Environment configuration
- `main_*.dart` - Entry points for different environments

## Best Practices

1. **Feature Isolation**

   - Keep feature-specific code within its UI directory
   - Maintain clear boundaries between features

2. **Data Flow**

   ```
   UI Layer → States → Services → Local/Remote API
   ```

3. **File Naming**

   - Prefix files with their layer: `ui_`, `data_`, etc.
   - Use descriptive suffixes: `_screen`, `_widget`, `_state`

4. **Directory Structure**

   ```
   feature/
   ├── widgets/
   ├── screens/
   └── states/
   ```

5. **State Management**

   - Keep states in `data_states/`
   - Use notifiers/blocs for complex state
   - Local states stay in feature directories

6. **Dependencies**
   - Register services in `di/`
   - Configure environments in `envs.dart`
   - Share common imports via `common_imports.dart`

## Development Guidelines

1. **New Features**

   - Create new directory under `ui_*`
   - Add routes to `router.dart`
   - Register dependencies in `di/`

2. **Data Layer**

   - Models in `data_models/`
   - Business logic in `data_states/`
   - API calls in `data_services/`

3. **UI Components**

   - Shared widgets in `ui_kit/`
   - Feature widgets in respective `ui_*/widgets/`

4. **Testing**
   - Mirror lib structure in test directory
   - Test files suffix: `_test.dart`

# Task 9 Flutter Project

First Flutter project

## Code Explanation

- **Main Function**:  
  The `main()` function starts the app by calling `runApp()` with the `MyApp()` widget as the root.

- **MyApp Widget**:  
  `MyApp` is a stateless widget that sets up the `MaterialApp` with:
  - `theme`: Sets the primary color to blue and font family to 'Suwannaphum'.
  - `title`: The app's title is set to 'Task 9'.
  - `home`: The `Task9` widget is displayed as the home screen.

- **Task9 Widget**:  
  `Task9` is a stateless widget:
  - `AppBar`: Displays a blue header with the title 'My first project'.
  - `body`: A `Padding` widget with 16.0 pixels of padding . Inside the body:
    - A `Column` widget with centered alignment contains:
      - A `Row` widget displaying two images:
        -  from local assets (`assets/images/sprints.png`).
        -  from a network URL (`https://picsum.photos/200/300`).
      - A `SizedBox` for gap.
      - A `Text` widget displaying 'The two images are displayed', with custom styling (font size, weight, and color).



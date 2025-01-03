# Signup Screen

This is a simple signup screen built with Flutter. It validates user input and shows a success message when all fields are valid. After signing up, users are redirected to the products page.

## Features

- **Form Validation**: Checks for valid name, email, password, and password confirmation.
- **Custom Form Fields**: Reusable input fields with validation.
- **Success Dialog**: Displays a message when the form is successfully submitted.
- **Navigation**: Redirects to the products page upon successful signup.


### Validation Rules

1. **Name**: Required and must start with a capital letter.
2. **Email**: Required and must contain "@".
3. **Password**: Must be at least 6 characters long.
4. **Confirm Password**: Must match the password.


### Mixins

The `ValidationMixin` contains methods for validating each input field.

### CustomFormField

This widget decreases redundancy and duplicated code.

```dart
class CustomFormField extends StatelessWidget {
  const CustomFormField({super.key, required this.controller, required this.validator, required this.labelText});

  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
```

## How It Works

1. **Text Editing Controllers**: The `TextEditingController` for each input field (name, email, password, confirm password) manages the user's input.
2. **Validation**: Each input field has its own validation method defined in the `ValidationMixin`. When the user submits the form, it checks if all fields are valid.
3. **Success Dialog**: If the form is validated, an alert dialog appears confirming account creation, and the user is redirected to the `ProductsPage`.
4. **CustomFormField**: A reusable widget for input fields

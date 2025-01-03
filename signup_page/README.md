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

# Navigation with Fade Animation


## Key Features


1. **`PageRouteBuilder`**:  
   Allows transitions between screens

2. **`FadeTransition`**:  
   Applies a fade effect during the screen transition

3. **`transitionDuration`**:  
   Specifies the duration of the animation. In this example, the transition takes **700 milliseconds**.

## Code Example

```dart
onPressed: () {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          FadeTransition(
        opacity: animation,
        child: ProductsPage(),
      ),
      transitionDuration: Duration(milliseconds: 700),
    ),
  );
},
```
# Localization 
## Setup
  In the main.dart file, the EasyLocalization widget is wrapped around the MaterialApp to manage localization. Here's the setup:

  ```dart
  import 'package:flutter/material.dart';
  import 'package:signup_page/auth/view/signup_screen.dart';
  import 'package:signup_page/products/view/products_screen.dart';
  import 'package:easy_localization/easy_localization.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    runApp(
      EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
        path: 'assets/lang', // Path to translation files
        fallbackLocale: Locale('en', 'US'),
        child: MyApp(),
      ),
    );
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Shopping App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: SignupScreen(),
      );
    }
  }

  ```

  ## Translation files
  Translation files are stored in the assets/lang folder in json format.

  en-US.json
  ```json
    {
    "sign_up": "Sign Up",
    "name": "Name",
    "email": "Email",
    "password": "Password",
    "confirm_password": "Confirm Password",
    "name_required": "Name is required",
    "name_capital": "Name must start with a capital letter",
    "email_required": "Email is required",
    "email_invalid": "Email must contain @",
    "password_length": "Password must be at least 6 characters",
    "password_mismatch": "Passwords do not match",
    "account_created": "Account Created Successfully",
    "close": "Close",
    "our_products": "OUR PRODUCTS",
    "product_catalog": "Product Catalog",
    "hot_offers": "Hot Offers",
    "added_to_cart": "{} added to cart",
    "lang": "Arabic"
  }

  ```

  ar-EG.json
  ```json
  {
  "sign_up": "تسجيل",
  "name": "الاسم",
  "email": "البريد الإلكتروني",
  "password": "كلمة المرور",
  "confirm_password": "تأكيد كلمة المرور",
  "name_required": "الاسم مطلوب",
  "name_capital": "يجب أن يبدأ الاسم بحرف كبير",
  "email_required": "البريد الإلكتروني مطلوب",
  "email_invalid": "يجب أن يحتوي البريد الإلكتروني على @",
  "password_length": "يجب أن تكون كلمة المرور 6 أحرف على الأقل",
  "password_mismatch": "كلمات المرور غير متطابقة",
  "account_created": "تم إنشاء الحساب بنجاح",
  "close": "إغلاق",
  "our_products": "منتجاتنا",
  "product_catalog": "كتالوج المنتجات",
  "hot_offers": "عروض ساخنة",
  "added_to_cart": "تمت إضافة {} إلى السلة",
  "lang": "English"
}

  ```

  ## Changing language
  the helper function changes the language by checking for current locale and acting with if statement

  ```dart
  void changeLang(BuildContext context) {
  Locale currentLocale = EasyLocalization.of(context)!.locale;
  if (currentLocale == Locale('en', 'US')) {
    EasyLocalization.of(context)!.setLocale(Locale('ar', 'EG'));
  } else {
    EasyLocalization.of(context)!.setLocale(Locale('en', 'US'));
  }
}
```

## Using translation
the tr() function shows the translation
```dart
Text(tr('sign_up')) // Displays the translated text for 'sign_up'
```
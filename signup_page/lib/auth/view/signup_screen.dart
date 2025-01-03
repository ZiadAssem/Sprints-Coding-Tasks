import 'package:flutter/material.dart';
import 'package:signup_page/auth/mixin/validation_mixin.dart';
import 'package:signup_page/auth/view/widgets/form_field.dart';
import 'package:signup_page/products/view/products_screen.dart';

class SignupScreen extends StatelessWidget with ValidationMixin {
  SignupScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomFormField(
                  controller: _nameController,
                  validator: validateName,
                  labelText: 'Name',
                ),
                SizedBox(height: 16),
                CustomFormField(
                  controller: _emailController,
                  validator: validateEmail,
                  labelText: 'Email',
                ),
                SizedBox(height: 16),
                CustomFormField(
                  controller: _passwordController,
                  validator: validatePassword,
                  labelText: 'Password',
                ),
                SizedBox(height: 16),
                CustomFormField(
                  controller: _confirmPasswordController,
                  validator: (value) =>
                      validateConfirmPassword(value, _passwordController.text),
                  labelText: 'Confirm Password',
                ),
                SizedBox(height: 16),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Color(Colors.blue.value)),
                        fixedSize: WidgetStatePropertyAll(Size(200, 50))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Account Created Successfully'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            FadeTransition(
                                          opacity: animation,
                                          child: ProductsPage(),
                                        ),
                                        transitionDuration:
                                            Duration(milliseconds: 700),
                                      ),
                                    );
                                  },
                                  child: Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text('Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:signup_page/auth/mixin/validation_mixin.dart';
import 'package:signup_page/auth/view/widgets/form_field.dart';
import 'package:signup_page/products/view/products_screen.dart';
import 'package:signup_page/utils/helper_functions.dart';

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
        title: Text(
          tr('sign_up'),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(onPressed: (){
            changeLang(context);
          }, child: Text(tr('lang')))
        ],
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
                  labelText: tr('name'),
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  controller: _emailController,
                  validator: validateEmail,
                  labelText: tr('email'),
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  controller: _passwordController,
                  validator: validatePassword,
                  labelText: tr('password'),
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  controller: _confirmPasswordController,
                  validator: (value) =>
                      validateConfirmPassword(value, _passwordController.text),
                  labelText: tr('confirm_password'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(tr('account_created')),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          FadeTransition(
                                        opacity: animation,
                                        child: const ProductsPage(),
                                      ),
                                      transitionDuration:
                                          const Duration(milliseconds: 700),
                                    ),
                                  );
                                },
                                child: Text(tr('close')),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                    tr('sign_up'),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}

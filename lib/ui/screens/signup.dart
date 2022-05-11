import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:nkap/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../data/models/user_model.dart';
import '../widgets/custom_formfield.dart';
import '../widgets/custom_header.dart';
import '../widgets/custom_richtext.dart';
import 'coin.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomHeader(
                      text: 'Sign Up',
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                    ),
                    Container(
                      height: 190,
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.09),
                      child: Image.asset("assets/images/signup.png"),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomFormField(
                              key: const ValueKey('emailSignUpField'),
                              headingText: "Email",
                              hintText: "Email",
                              suffixIcon: const SizedBox(),
                              controller: _emailController,
                              maxLines: 1,
                              obscureText: false,
                              textInputType: TextInputType.emailAddress,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                return value != null &&
                                        !EmailValidator.validate(value)
                                    ? 'Enter a valid email'
                                    : null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomFormField(
                              key: const ValueKey('passwordSignUpField'),
                              controller: _passwordController,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                return value != null && value.length < 6
                                    ? "Enter min. 6 characters"
                                    : null;
                              },
                              headingText: "Password",
                              hintText: "Password",
                              suffixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                child: GestureDetector(
                                  onTap: _toggle,
                                  child: Icon(
                                    _obscureText
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded,
                                    size: 24,
                                  ),
                                ),
                              ),
                              maxLines: 1,
                              obscureText: _obscureText,
                              textInputType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Column(children: [
                              authProvider.status == Status.registering
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          // _createAccountWithEmailAndPassword(
                                          //     context);

                                          if (_formKey.currentState!
                                              .validate()) {
                                            UserModel userModel =
                                                await authProvider
                                                    .registerWithEmailAndPassword(
                                                        email: _emailController
                                                            .text,
                                                        password:
                                                            _passwordController
                                                                .text);

                                            if (userModel == null) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(authProvider
                                                          .status.name)));
                                            } else {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Coin()));
                                            }
                                          }
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Sign Up'),
                                        ),
                                      ),
                                    ),
                              CustomRichText(
                                discription: "Already have an account? ",
                                text: "Log In",
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()));
                                },
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

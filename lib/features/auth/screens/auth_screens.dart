import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/common/widgets/CustomButton.dart';
import 'package:flutter_amazon_clone/common/widgets/custom_textfield.dart';
import 'package:flutter_amazon_clone/constants/global_variables.dart';
import 'package:flutter_amazon_clone/features/auth/services/auth_service.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screens';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup; //we initially selected signup
  final _signUpFromKey = GlobalKey<FormState>();
  final _signInFromKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthService authService = AuthService();

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        name: _nameController.text,
        password: _passwordController.text);
    print("rakib");
  }

  void signInUser() {
    authService.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: Text("create account"),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup, //which button represent it
                  groupValue: _auth, //which button is selected initially
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth =
                          val!; // after selecting the _auth value will be changed to sign up
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFromKey,
                    child: Column(children: [
                      CustomTextField(
                        controller: _nameController,
                        hintText: 'name',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'email',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'password',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          onTap: () {
                            if (_signUpFromKey.currentState!.validate()) {
                              signUpUser();
                            }
                          },
                          text: 'Sign Up')
                    ]),
                  ),
                ),
              ListTile(
                title: Text("Sign in"),
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin, //which button represent it
                  groupValue: _auth, //which button is selected initially
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth =
                          val!; // after selecting the _auth value will be changed to sign in
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signInFromKey,
                    child: Column(children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'email',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'password',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          onTap: () {
                            if (_signInFromKey.currentState!.validate()) {
                              signInUser();
                            }
                          },
                          text: 'Sign In')
                    ]),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

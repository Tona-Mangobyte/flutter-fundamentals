import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../widgets/radius_button.dart';
import '../../widgets/radius_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late FocusNode _passwordFocusNode;

  bool isEmail(String input) => RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(input);
  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{3,4}$')
          .hasMatch(input);

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: _scaffoldKey,
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(gradient: AppColors.gradientPrimary),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 24,
                        ),
                      child: Column(
                        children: [
                          _buildLoginForm(),
                          _buildLoginButton(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: RadiusTextField(
              controller: _emailController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Please enter email or phone';
                } else if (!isEmail(text) && !isPhone(text)) {
                  return 'Please enter valid email or phone';
                }
                return null;
              },
            ),
          ),
          RadiusTextField(
            focusNode: _passwordFocusNode,
            controller: _passwordController,
            hintText: 'Password',
            obscureText: true,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: RadiusButton(
        text: 'Login',
        textColor: Colors.white,
        color: AppColors.green,
        onPressed: _authProcess,
      ),
    );
  }

  void _authProcess() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
  }
}
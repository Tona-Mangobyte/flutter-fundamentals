import 'package:flutter/material.dart';

import '../common/app_color.dart';
import '../widgets/radius_button.dart';
import '../widgets/radius_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    const title = 'Authentication';

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(title),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: _buildAuthForm(),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: ()=> loginProcess(null, null),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
  Widget _buildAuthForm() {

    return Container(
      height: double.infinity,
      decoration: BoxDecoration(gradient: AppColors.gradientPrimary),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 24.0),
                child: Column(
                  children: <Widget>[
                     _buildAuthenticateForm(),
                    _buildLoginButton(),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  Widget _buildAuthenticateForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12.0),
            child: RadiusTextField(
              controller: _emailController,
              hintText: 'email',
              // key:_key ,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onEditingComplete: () =>
                  FocusScope.of(context).requestFocus(_passwordFocusNode),
              validator: (text) {
                if (text!.isEmpty) {
                  return 'email is required';
                } else if (!isEmail(text) && !isPhone(text)) {
                  return 'invalid email';
                }
                return null;
              },
            ),
          ),
          RadiusTextField(
            focusNode: _passwordFocusNode,
            controller: _passwordController,
            hintText: 'password',
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
        onPressed: () {
          FocusScope.of(context).unfocus();
          if (!_formKey.currentState!.validate()) return;
          loginProcess(_emailController.text, _passwordController.text);
        },
      ),
    );
  }

  void loginProcess(String? email, String? password) {
    print('Login process started... email: $email, password: $password');
  }
}
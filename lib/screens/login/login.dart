import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:emotion_diary/screens/signup/signup.dart';
import 'package:emotion_diary/screens/dasdboard/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool passWordVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1BEE7), // Light Purple Background
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30), // Adjusted Padding
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 50),
                    _buildEmailField(),
                    const SizedBox(height: 20),
                    _buildPasswordField(),
                    _buildForgotPasswordButton(),
                    const SizedBox(height: 30),
                    _buildLoginButton(),
                    const SizedBox(height: 15),
                    _buildSignUpButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("assets/logo.jpeg"),
        ),
        const SizedBox(height: 30),
        const Text(
          "Welcome Back",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 4),
        const Text(
          "Sign in to continue",
          style: TextStyle(fontSize: 16, color: Color(0xF20E0000)),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        label: const Text("Email"),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: "user@gmail.com",
        hintStyle: const TextStyle(fontSize: 16, color: Color(0xff9F9F9F)),
        prefixIcon: const Icon(Icons.email, size: 20, color: Colors.black54),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter your email.';
        String emailPattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
        if (!RegExp(emailPattern).hasMatch(value)) return 'Please enter a valid email address.';
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: passWordVisibility,
      decoration: InputDecoration(
        label: const Text("Password"),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: "**********",
        hintStyle: const TextStyle(fontSize: 16, color: Color(0xff9F9F9F)),
        prefixIcon: const Icon(Icons.lock, size: 20, color: Colors.black54),
        suffixIcon: IconButton(
          icon: Icon(passWordVisibility ? Icons.visibility_off : Icons.visibility, color: Colors.black54),
          onPressed: () => setState(() => passWordVisibility = !passWordVisibility),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter your password.';
        if (value.length < 6) return 'Password must be at least 6 characters long.';
        return null;
      },
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Forgot Password Logic
        },
        child: const Text("Forgot Password?"),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFBA68C8),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
        } else {
          if (kDebugMode) print("Validation failed");
        }
      },
      child: const Text(
        "Login",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          text: "New User? ",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 105, 105, 105)),
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (kDebugMode) print("Sign Up");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
              text: "Sign Up",
              style: const TextStyle(color: Color(0xFFBA68C8), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

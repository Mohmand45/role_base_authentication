import 'package:eaziline/screens/admin/admin_login_screen.dart';
import 'package:eaziline/services/authentication_service.dart';
import 'package:flutter/material.dart';

class AdminSignupScreen extends StatefulWidget {
  const AdminSignupScreen({Key? key}) : super(key: key);

  @override
  _AdminSignupScreenState createState() => _AdminSignupScreenState();
}

class _AdminSignupScreenState extends State<AdminSignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthenticationService _authenticationService = AuthenticationService();

  void _handleSignup(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;

    String? userId = await _authenticationService.adminSignup(email, password);

    if (userId != null) {
      // Admin signup successful
      // Redirect to login screen or perform any necessary actions
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdminLoginScreen()),
      );
    } else {
      // Signup failed
      // Show an error message to the admin
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signup failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Signup'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/images/signup.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.blue,
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_open,
                    color: Colors.blue,
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () => _handleSignup(context),
                  child: const Text('Signup'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 15.0,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Navigate to signup screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminLoginScreen()),
                  );
                },
                child: const Text("Don't have an account? Signup"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

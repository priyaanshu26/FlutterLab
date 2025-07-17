import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController(text: '');
  TextEditingController _emailController = TextEditingController(text: '');
  TextEditingController _phoneNumberController = TextEditingController(
    text: '',
  );
  TextEditingController _passwordController = TextEditingController(text: '');
  TextEditingController _confirmPasswordController = TextEditingController(
    text: '',
  );

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Signup Form', style: TextStyle(color: Colors.white)),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          children: [
            // Name
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: 30),

            // Email
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your Email',
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(height: 30),

            // Phone Number
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone',
                hintText: 'Enter your Phone number',
                border: UnderlineInputBorder(),
              ),
              maxLength: 10,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 30),

            // Password
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: UnderlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(!_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  }
                )
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
              obscureText: !_isPasswordVisible,
              obscuringCharacter: '*',

            ),
            SizedBox(height: 30),

            // Confirm Password
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: UnderlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                    icon: Icon(!_isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off)
                )
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter conform password';
                }
                if (value != _passwordController.text) {
                  return 'Password does not match';
                }
                return null;
              },
              obscureText: !_isConfirmPasswordVisible,
              obscuringCharacter: '*',
            ),
            SizedBox(height: 30),

            Center(
              child: ElevatedButton(onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.reset();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              }, child: Text('Submit')),
            )
          ],
        ),

      ),
    );
  }
}

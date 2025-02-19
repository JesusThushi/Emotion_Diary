import 'package:flutter/material.dart';

class UpdatePersonalInfoScreen extends StatefulWidget {
  @override
  _UpdatePersonalInfoScreenState createState() => _UpdatePersonalInfoScreenState();
}

class _UpdatePersonalInfoScreenState extends State<UpdatePersonalInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1BEE7), // Light Purple Background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Update Personal Information',
          style: TextStyle(fontSize:20, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(size: 20, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildProfileIcon(), // Profile icon instead of picture
                const SizedBox(height: 20),
                _buildTextField('Name', _nameController, Icons.person),
                const SizedBox(height: 20),
                _buildTextField('Email', _emailController, Icons.email),
                const SizedBox(height: 20),
                _buildTextField('Phone', _phoneController, Icons.phone),
                const SizedBox(height: 30),
                _buildUpdateButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to display a profile icon instead of an image
  Widget _buildProfileIcon() {
    return const CircleAvatar(
      radius: 60,
      backgroundColor: Colors.white,
      child: Icon(
        Icons.account_circle,
        size: 75,
        color: Color.fromARGB(137, 77, 76, 76),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, IconData icon) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(icon, color: Colors.black54),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter your $label';
        if (label == 'Email' && !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _buildUpdateButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFBA68C8),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Personal Information Updated')),
          );
        }
      },
      child: const Text(
        "Update Information",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

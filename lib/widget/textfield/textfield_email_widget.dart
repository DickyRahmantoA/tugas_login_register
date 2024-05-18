import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_login_register/provider/auth_provider.dart';

class TextFieldEmailWidget extends StatefulWidget {
  const TextFieldEmailWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<TextFieldEmailWidget> createState() => _TextFieldEmailWidgetState();
}

class _TextFieldEmailWidgetState extends State<TextFieldEmailWidget> {
  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<AuthProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Email",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: widget.controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.isEmpty || value == "") {
              return "Email can't be empty";
            } else if (!value.trim().contains("@")) {
              return "Email not valid";
            }
            return null;
          },
          onSaved: (value) {
            loadAuth.enteredEmail = value!;
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Insert Email..."),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_login_register/provider/auth_provider.dart';

class TextFieldPasswordWidget extends StatefulWidget {
  const TextFieldPasswordWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<TextFieldPasswordWidget> createState() =>
      _TextFieldPasswordWidgetState();
}

class _TextFieldPasswordWidgetState extends State<TextFieldPasswordWidget> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<AuthProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Password",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: widget.controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText,
          validator: (value) {
            if (value!.trim().isEmpty || value == "") {
              return "Password can't be empty";
            } else if (value.trim().length < 6) {
              return "Password should more than 6 character";
            }
            return null;
          },
          onSaved: (value) {
            loadAuth.enteredPassword = value!;
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Insert Password...",
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: const Icon(Icons.remove_red_eye_rounded))),
        )
      ],
    );
  }
}

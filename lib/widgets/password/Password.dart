import 'package:advanture_loginpage_password/widgets/password/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/link.dart';

class PasswordWidget extends StatelessWidget {
  final String linkPage;
  const PasswordWidget({super.key, required this.linkPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
        color: backgroundColor,
        child: Column(
          children: [
            InputDescription(text: "Пароль"),
            Password(),
            ForgetPasswor(link: linkPage),
          ],
        ),
      ),
    );
    ;
  }
}

class InputDescription extends StatelessWidget {
  final String text;
  const InputDescription({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(color: blueColor, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class Password extends StatefulWidget {
  const Password({super.key});
  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: passwordVisible,
      decoration: InputDecoration(
        filled: true,
        fillColor: whiteColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: blueColor)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: blueColor),
        ),
        hintText: "password",
        // helperText: "Забыли пароль? Вам сюда!",
        helperStyle: TextStyle(color: greyColor),
        suffixIcon: IconButton(
          color: blueColor,
          icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () => setState(() => passwordVisible = !passwordVisible),
        ),
      ),
    );
  }
}

class ForgetPasswor extends StatelessWidget {
  final String link;
  const ForgetPasswor({
    Key? key,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Link(
          uri: Uri.parse(link),
          builder: (context, followLink) {
            return Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Забыли пароль? ",
                    style: TextStyle(color: greyColor),
                  ),
                  TextSpan(
                    text: "Вам сюда!",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: blueColor,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = followLink,
                  ),
                ]),
              ),
            );
          }),
    );
  }
}

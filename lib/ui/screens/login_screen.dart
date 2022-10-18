import 'package:flutter/material.dart';
import 'package:mobile_form/core/models/auth_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Login loginProvider = Provider.of<Login>(context);
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text("Please log in first to access the application",
                style: TextStyle(fontSize: 16.0)),
            const SizedBox(height: 20),
            TextFormField(
              autofocus: true,
              controller: usernameController,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Username',
                  icon: Icon(Icons.person)),
            ),
            TextFormField(
              controller: passwordController,
              obscureText: loginProvider.isShowPassword == true ? false : true,
              decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Password',
                  icon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () {
                        loginProvider.isPasswordShown();
                      },
                      icon: loginProvider.isShowPassword == true
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.remove_red_eye_outlined))),
            ),
            const SizedBox(height: 10.0),
            loginProvider.errorMessage.toString() == ''
                ? const Text('')
                : Text(
                    loginProvider.errorMessage.toString(),
                    style: const TextStyle(color: Colors.red),
                  ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {}, child: const Text("Forgot Password"))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<Login>(context, listen: false).login(
                          usernameController.text,
                          passwordController.text,
                          context);
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                    side:
                                        const BorderSide(color: Colors.blue)))),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Text("Sign in"),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(children: const <Widget>[
              Expanded(
                  child: Divider(
                color: Colors.black,
              )),
              Padding(
                padding: EdgeInsets.only(left: 14.0, right: 14.0),
                child: Text("OR"),
              ),
              Expanded(child: Divider(color: Colors.black)),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    child: const Text("Sign up"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

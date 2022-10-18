import 'package:flutter/material.dart';
import 'package:mobile_form/core/models/auth_model.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Register registerProvider = Provider.of<Register>(context);
    final TextEditingController emailController = TextEditingController();
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
            const Text("Please create an account to login",
                style: TextStyle(fontSize: 16.0)),
            const SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email',
                  icon: Icon(Icons.mail)),
            ),
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Username',
                  icon: Icon(Icons.person)),
            ),
            TextFormField(
              controller: passwordController,
              obscureText:
                  registerProvider.isShowPassword == true ? false : true,
              decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Password',
                  icon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () {
                        registerProvider.isPasswordShown();
                      },
                      icon: registerProvider.isShowPassword == true
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.remove_red_eye_outlined))),
            ),
            const SizedBox(height: 20.0),
            const Center(
              child: Text(
                "Please read the Terms and Conditions to register this application",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<Register>(context, listen: false).register(
                          usernameController.text,
                          passwordController.text,
                          emailController.text,
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
                      child: Text("Sign up"),
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
                      Navigator.pushNamed(context, 'login');
                    },
                    child: const Text("Sign in"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

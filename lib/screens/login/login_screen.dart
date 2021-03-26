import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:onetime/post/post_page.dart';
import 'package:onetime/view_models/login_view_model_google.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body:Center(
        child: Consumer<LoginViewModel>(
          builder: (context, model, child){
            return model.isLoading
                ? CircularProgressIndicator() :Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'OneTime!',
                  style: TextStyle(
                      fontSize: 40,
                      foreground: Paint()
                        ..shader = ui.Gradient.linear(
                          const Offset(0, 20),
                          const Offset(150, 20),
                          <Color>[
                            Colors.lightBlue,
                            Colors.blue,
                          ],
                        )
                  ),
                ),
                SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: () => loginGoogle(context),
                ),
                SignInButton(
                  Buttons.Email,
                  text: "Sign up with Email",
                  onPressed: () => loginMail(context),
                ),


              ],

            );

          },

        ),
      ),
    );
  }

  loginGoogle(BuildContext context) async{
    final loginViewModel = Provider.of<LoginViewModel>(context,listen:false);
    await loginViewModel.sighIn();
    if (!loginViewModel.isSuccessful){
      Fluttertoast.showToast(msg: "signInFailed");
      return;
    }
    //_openHomeScreen(context);

  }

  /*void _openHomeScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder:(_) => PublishClassScreen()));
  }
 */
  loginMail(BuildContext context) async{

  }


}

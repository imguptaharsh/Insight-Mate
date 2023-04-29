// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:hackathon_gpt/Frontend/screen/homescreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Backend/constants/api_consts.dart';
import '../../Backend/constants/error_handling.dart';
import '../../Backend/providers/user_provider.dart';
import '../models/user.dart';

class AuthService {
  //SIGN UP USER
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        user: '',
        type: '',
        token: '',
        verified: 0,
        phone: 0,
        cart: [],
      );
      EmailValidator.validate(email);

      final userProvider = Provider.of<UserProvider>(context, listen: false);
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; chatset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, 'Account Created!');

            try {
              await http.post(
                Uri.parse('$uri/mail/welcome'),
                headers: {
                  'Content-Type': 'application/json; charset=UTF-8',
                  'x-auth-token': userProvider.user.token,
                },
                body: jsonEncode({
                  'email_address': email,
                  'name': name,
                }),
              );
            } catch (e) {
              showSnackBar(context, e.toString());
            }
            //**********************************SIGN IN USER**************************//

            try {
              http.Response res = await http.post(Uri.parse('$uri/api/signin'),
                  body: jsonEncode({'email': email, 'password': password}),
                  headers: <String, String>{
                    'Content-Type': 'application/json; chatset=UTF-8',
                  });
              httpErrorHandle(
                  response: res,
                  context: context,
                  onSuccess: () async {
                    //Getting instance
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    //Saving Data
                    Provider.of<UserProvider>(context, listen: false)
                        .setUser(res.body);
                    //Setting auth token
                    await prefs.setString(
                        'x-auth-token', jsonDecode(res.body)['token']);
                  });
            } catch (e) {
              showSnackBar(context, e.toString());
            }

            //**************************************************************** */
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //SIGN IN USER
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; chatset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            //Getting instance
            SharedPreferences prefs = await SharedPreferences.getInstance();
            //Saving Data
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            //Setting auth token
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            //Navigating to the Home Screen
            Navigator.pushNamed(
              context,
              HomeScreen.routeName,
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

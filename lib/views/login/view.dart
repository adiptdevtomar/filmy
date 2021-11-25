import 'dart:convert';

import 'package:filmy/domain/models/auth_details.dart';
import 'package:filmy/views/app/app_extensions.dart';
import 'package:filmy/views/app/routes/router.dart';
import 'package:filmy/views/helper.dart';
import 'package:filmy/views/home_view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'controller.dart';

part 'widgets/google_anim.dart';

class LoginPageView extends ConsumerWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final state = watch(_vsProvider);
    final stateController = watch(_vsProvider.notifier);

    return Scaffold(
      body: Center(
        child: (state.isChecking == ViewStatus.loading)
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                      ),
                      onPressed: stateController.onLoginTapped,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GoogleAnim(
                            show: (state.status == ViewStatus.loading),
                            height: 40.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Login with Google',
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  GestureDetector(
                    onTap: stateController.onSkipPressed,
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

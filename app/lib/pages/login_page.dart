import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              Hero(
                tag: 'hero',
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 48.0,
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              SizedBox(height: 24.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                  ),
                  onPressed: ssoLogin,
                  child: Text('Log with FusionAuth', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ssoLogin() async {
    final hostIp = '10.0.7.177:9011'; // FusionAuth Host
    final hostUrl = 'http://$hostIp';
    final appAuth = FlutterAppAuth();
    try {
      final result = await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          '1b62d181-b4f9-4b44-87ad-38a2e29066b6',
          'com.example.loginsso://oauth2',
          issuer: hostUrl,
          scopes: [
            'openid',
            'offline_access',
            'email',
          ],
          promptValues: [
            'login',
          ],
          loginHint: 'bob',
          allowInsecureConnections: true,
          additionalParameters: {
            'idp_hint': '18ca0ac2-b7c4-4f18-8201-5352a3eac2d4',
          },
          // serviceConfiguration: AuthorizationServiceConfiguration(
          //   authorizationEndpoint: '$hostUrl/oauth2/authorize',
          //   tokenEndpoint: '$hostUrl/oauth2/token',
          // ),
        ),
      );
      print(result.idToken);
      Navigator.of(context).pushNamed(HomePage.tag);
    } catch (e) {
      String message = e.message;
      scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text("Error: $message"),
        duration: const Duration(seconds: 6),
      ));
      print(e);
    }
  }
}

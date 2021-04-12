import 'package:chat/models/auth_data.dart';
import 'package:chat/widgets/auth_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  bool _isLoading = false;

  Future<void> _handleSubmit(AuthData authData) async {
    try {
      setState(() {
        _isLoading = true;
      });
      if (authData.isSignIn) {
        await _auth.signInWithEmailAndPassword(
          email: authData.email.trim(),
          password: authData.password,
        );
      } else {
        AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: authData.email.trim(),
          password: authData.password,
        );

        final userData = {
          'name': authData.name,
          'email': authData.email,
        };

        await Firestore.instance
            .collection('users')
            .document(authResult.user.uid)
            .setData(userData);
      }
    } on PlatformException catch (e) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(e.message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                AuthForm(onSubmit: _handleSubmit),
                if (_isLoading)
                  Positioned.fill(
                    child: Container(
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                      ),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

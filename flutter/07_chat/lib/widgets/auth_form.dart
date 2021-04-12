import 'package:chat/models/auth_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthData authData) onSubmit;

  const AuthForm({Key key, @required this.onSubmit}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final AuthData _authData = AuthData();
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _submitForm() {
    bool isFormValid = _formKey.currentState.validate();

    FocusScope.of(context).unfocus();

    if (isFormValid) {
      widget.onSubmit(_authData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  if (_authData.isSignUp)
                    TextFormField(
                      key: ValueKey('name'),
                      onChanged: (value) => _authData.name = value,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Nome não pode ser vazio';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Nome',
                      ),
                    ),
                  TextFormField(
                    key: ValueKey('email'),
                    onChanged: (value) => _authData.email = value,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'E-mail não pode ser vazio';
                      }

                      if (value == null || !value.contains('@')) {
                        return 'E-mail não pode ser vazio';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                    ),
                  ),
                  TextFormField(
                    key: ValueKey('password'),
                    obscureText: true,
                    onChanged: (value) => _authData.password = value,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Senha não pode ser vazio';
                      }

                      if (value == null || value.length < 6) {
                        return 'Senha deve conter no minimo 6 caracteres';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text(_authData.isSignIn ? 'Entrar' : 'Cadastrar'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _authData.toggleMode();
                      });
                    },
                    child: Text(
                      _authData.isSignIn
                          ? 'Criar uma nova conta?'
                          : 'Ja tenho uma conta',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

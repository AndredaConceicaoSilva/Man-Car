import 'package:flutter/material.dart';
import 'package:mancar/field_form.dart';
import 'package:mancar/user.dart';
import 'package:mancar/user_provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void save(){
      UserProvider userProvider = UserProvider.of(context)as
      UserProvider;

      User user = User(
        name: controllerName.text,
        email: controllerEmail.text,
        password: controllerPassword.text
        );

        //salva um novo usuario
        userProvider.users.insert(0,user);

        //busca o usurio salvo
        print(userProvider.users[0].name);

        //navegar na lista de usuarios
    }

    return Scaffold(
      appBar: AppBar(
        title:Text('Create User'),
      ),
      body: Center(
        child: Column(
          children: [
            FieldForm(label: 'Name',
             isPassword: false,
              controller: controllerName
              ),
              FieldForm(label: 'Email',
              isPassword: false,
              controller: controllerEmail
              ),
              FieldForm(label: 'Password',
             isPassword: true,
              controller: controllerPassword
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: save,
                  child: Text('Salvar'),
                  style: ButtonStyle(
                  backgroundColor:  MaterialStateProperty.all(Theme.of
                  (context).primaryColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white)
                 ),
                 ),
              ),
          ],
        ),
      ),
    );
  }
}
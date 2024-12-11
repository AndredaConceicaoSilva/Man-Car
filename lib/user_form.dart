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


  String title = "Create Users";

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void save(){
      UserProvider userProvider = UserProvider.of(context)as
      UserProvider;

      int? index;

      if(userProvider.indexUser != null){
        index = userProvider.indexUser;
        controllerName.text = userProvider.userSelected!.name;
        controllerEmail.text = userProvider.userSelected!.email;
        controllerPassword.text = userProvider.userSelected!.password;

        setState(() {
          this.title = "Edit User";
        });
      }

      User user = User(
        name: controllerName.text,
        email: controllerEmail.text,
        password: controllerPassword.text
        );

      if(index != null){
        userProvider.users[index] = user;
        } else{
          int usersLeng = userProvider.users.length;
      


        //salva um novo usuario
        userProvider.users.insert(usersLeng,user);
        }

        //busca o usurio salvo
        print(userProvider.users[0].name);

        //navegar na lista de usuarios
        Navigator.popAndPushNamed(context, "/list");
    }
    

    return Scaffold(
      appBar: AppBar(
        title:Text('Create User'),
        actions: [
          Container(
              child: TextButton(
                child: Text(this.title),
                onPressed: (){
                  Navigator.popAndPushNamed(context, "/list");
                },
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                margin:EdgeInsets.all(8)
          ),
        ],
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
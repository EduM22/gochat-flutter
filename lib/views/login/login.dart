import 'package:flutter/material.dart';
import 'package:gochat/views/login/viewModel.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Spacer(),
              Form(
                key: viewModel.formKey,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 40,
                    right: 40
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'email'),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'password'),
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(double.infinity, 50)
                          )
                        ),
                        onPressed: () => viewModel.validateForm(),
                        child: Text('Login')
                      )
                    ],
                  )
                )
              ),
              Spacer(),
            ]
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gochat/views/chat/viewModel.dart';
import 'package:stacked/stacked.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
      viewModelBuilder: () => ChatViewModel(),
      onModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) => Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(viewModel.messages[index]);
                  }
                )
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 5,
                  right: MediaQuery.of(context).size.width / 5,
                  bottom: 20
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Form(
                        key: viewModel.formKey,
                        child: TextFormField(
                          controller: viewModel.messageController,
                          decoration: InputDecoration(labelText: 'message'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      child: IconButton(
                        onPressed: () => viewModel.validateForm(),
                        icon: Icon(Icons.send)
                      ),
                    ),
                  ],
                ) 
              )
            ],
          ),
        ),
      ),
    );
  }
}

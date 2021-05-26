import 'package:flutter/material.dart';
import 'package:gochat/views/chat/viewModel.dart';
import 'package:stacked/stacked.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
      viewModelBuilder: () => ChatViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(),
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
              Spacer(),
              Container(
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Form(
                        key: viewModel.formKey,
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'message'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                      IconButton(onPressed: () => viewModel.validateForm(), icon: Icon(Icons.search))  
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

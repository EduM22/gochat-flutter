import 'package:flutter/material.dart';
import 'package:gochat/views/home/home.dart';
import 'package:gochat/views/chat/chat.dart';
import 'package:gochat/views/nav/viewModel.dart';
import 'package:stacked/stacked.dart';

class NavView extends StatelessWidget {
  const NavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NavViewModel>.reactive(
      createNewModelOnInsert: false,
      onModelReady: (viewModel) => viewModel.init(),
      builder: (context, model, child) => Scaffold(
        body: getViewForIndex(model.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
              label: 'Posts',
              icon: Icon(Icons.art_track),
            ),
            BottomNavigationBarItem(
              label: 'Todos',
              icon: Icon(Icons.list),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => NavViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return ChatView();
      default:
        return HomeView();
    }
  }
}
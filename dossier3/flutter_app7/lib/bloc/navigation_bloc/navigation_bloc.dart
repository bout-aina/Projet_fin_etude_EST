import 'package:bloc/bloc.dart';
import 'package:flutter_app7/pages/homepage.dart';

import 'package:flutter_app7/pages/myoderspage.dart';


enum NavigationEvents {
  HomePageClickedEvent,
  MyOrdersClickedEvent,

}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {

  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;

      case NavigationEvents.MyOrdersClickedEvent:
        yield MyOrdersPage();
        break;


    }
  }
}
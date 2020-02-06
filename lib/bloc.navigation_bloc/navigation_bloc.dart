import 'package:bloc/bloc.dart';
import '../pages/home_page.dart';
import '../pages/account_page.dart';

enum NavigationEvents {
    HomePageClickedEvent,
    AccountClickedEvent,
    // NotificationClickedEvent,
    // SettingsClickedEvent
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
            case NavigationEvents.AccountClickedEvent:
                yield AccountPage();
                break;
            // case NavigationEvents.NotificationClickedEvent:
            //     yield NotificationPage();
            //     break;
            // case NavigationEvents.AccountClickedEvent:
            //     yield SettingsPage();
            //     break;
            // default:
        }
    }
}
import 'dart:convert';
import '3-util.dart';

Future<String> greetUser() async {
  try {
    String data = await fetchUserData();
    Map<String, dynamic> user = jsonDecode(data);
    return 'Hello ${user['username']}';
  } catch (e) {
    return 'error caught: $e';
  }
}

Future<String> loginUser() async {
  try {
    bool loggedIn = await checkCredentials();
    print('There is a user: $loggedIn');
    if (loggedIn) {
      return await greetUser();
    }
    return 'Wrong credentials';
  } catch (e) {
    return 'error caught: $e';
  }
}

import 'dart:convert';
import '1-util.dart';

Future<String> getUserId() async {
  String data = await fetchUserData();
  Map<String, dynamic> user = jsonDecode(data);
  return user['id'];
}

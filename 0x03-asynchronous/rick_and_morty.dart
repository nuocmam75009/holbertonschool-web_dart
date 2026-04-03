import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> printRmCharacters() async {
  try {
    String? nextUrl = 'https://rickandmortyapi.com/api/character';

    while (nextUrl != null) {
      final response = await http.get(Uri.parse(nextUrl));
      final Map<String, dynamic> data = jsonDecode(response.body);

      for (var character in data['results']) {
        print(character['name']);
      }

      nextUrl = data['info']['next'];
    }
  } catch (e) {
    print('error caught: $e');
  }
}

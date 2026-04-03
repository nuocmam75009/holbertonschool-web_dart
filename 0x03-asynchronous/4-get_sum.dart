import 'dart:convert';
import '4-util.dart';

Future<num> calculateTotal() async {
  try {
    String userData = await fetchUserData();
    Map<String, dynamic> user = jsonDecode(userData);
    String id = user['id'];

    String ordersData = await fetchUserOrders(id);
    List<dynamic> orders = jsonDecode(ordersData);

    double total = 0;
    for (String product in orders) {
      String priceData = await fetchProductPrice(product);
      total += jsonDecode(priceData);
    }

    return total;
  } catch (e) {
    return -1;
  }
}

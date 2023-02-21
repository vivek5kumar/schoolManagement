import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    update();
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    _totalPrice = prefs.getDouble(
          'total_price',
        ) ??
        0;
    update();
  }

// add to cart items function
  void addCounter() {
    _counter++;
    _setPrefItems();
    update();
  }

// remove to cart items function

  int removeCounter() {
    _counter--;
    _setPrefItems();
    return _counter;
  }

  int getCounter() {
    _getPrefItems();
    return _counter;
  }

  // add to totalprice items function
  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefItems();
    update();
  }

// remove to cart items function

  int removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPrefItems();
    return _counter;
  }

  double getTotalPrice() {
    _getPrefItems();
    return _totalPrice;
  }
}

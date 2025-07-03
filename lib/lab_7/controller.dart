import 'package:lab/assets/import_export.dart';

class Controller {
  RxList<Map<String, dynamic>> items = [
    {'title': 'Apple', 'isFav': false},
    {'title': 'Banana', 'isFav': true},
    {'title': 'Orange', 'isFav': false},
  ].obs;

  void toggleFav(int index) {
    items[index]['isFav'] = !items[index]['isFav'];
    items.refresh();
  }
  void addItem(String title) {
    items.add({'title': title, 'isFav': false});
  }

  void deleteItem(int index) {
    items.removeAt(index);
  }

}

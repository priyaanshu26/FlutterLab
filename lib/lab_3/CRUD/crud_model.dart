import '../../assets/import_export.dart';

class CRUDModel {
  final List<dynamic> _list = [];

  void addItem(dynamic item) {
    _list.add(item);
  }

  void deleteItem(index) {
    _list.removeAt(index);
  }

  void updateItem(index, item) {
    _list[index] = item;
  }

  List<dynamic> getItems() {
    return _list;
  }

  void toggleFavoriteStatus(item, index) {
    item[KEY_IS_FAVOURITE] = !item[KEY_IS_FAVOURITE];
    _list[index] = item;
  }
}

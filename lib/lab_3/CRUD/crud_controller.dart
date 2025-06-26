import '../../assets/import_export.dart';

class CRUDController {
  CRUDModel _model = CRUDModel();

  void addItem(item) => _model.addItem(item);

  void deleteItem(index) => _model.deleteItem(index);

  void updateItem(item, index) => _model.updateItem(index, item);

  List<dynamic> getItems() => _model.getItems();

  void toggleFavoriteStatus(item, index) =>
      _model.toggleFavoriteStatus(item, index);
}

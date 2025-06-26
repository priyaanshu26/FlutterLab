import 'package:flutter/cupertino.dart';
import '/assets/import_export.dart';

class ItemListView extends StatefulWidget {
  ItemListView({super.key});

  static final CRUDController crudController = CRUDController();

  @override
  State<ItemListView> createState() => _ItemListView();
}

class _ItemListView extends State<ItemListView> {
  void refreshScreen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final items = ItemListView.crudController.getItems();

    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_LIST_VIEW),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => AddPage()))
                  .then((_) => refreshScreen());
            },
          ),
        ],
      ),
      body: items.isNotEmpty
          ? ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(
                MaterialPageRoute(
                  builder: (_) => AddPage(item: item, index: index),
                ),
              )
                  .then((_) => refreshScreen());
            },
            leading: IconButton(
              icon: Icon(
                item[KEY_IS_FAVOURITE] ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {
                ItemListView.crudController.toggleFavoriteStatus(item, index);
                refreshScreen();
              },
            ),
            title: Text(item[KEY_NAME]),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => CupertinoAlertDialog(
                    title: Text(CMN_DELETE_DATA),
                    actions: [
                      TextButton(
                        onPressed: () {
                          ItemListView.crudController.deleteItem(index);
                          Navigator.pop(context);
                          refreshScreen();
                        },
                        child: Text(BTN_DELETE),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      )
          : Center(
        child: Text(
          CMN_NO_DATA_FOUND,
          style: TextStyle(color: Colors.grey[400]),
        ),
      ),
    );
  }
}

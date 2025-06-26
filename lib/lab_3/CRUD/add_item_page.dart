import '../../assets/import_export.dart';

class AddPage extends StatelessWidget {
  dynamic item;
  int? index;

  AddPage({super.key, this.item, this.index}) {
    if (item != null) _nameController.text = item[KEY_NAME];
  }

  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_ADD_PAGE)),
      body: Column(
        children: [
          TextFormField(controller: _nameController),
          ElevatedButton(
            onPressed: () {
              if (item != null) {
                item[KEY_NAME] = _nameController.text.toString();
                item.curdController.updateItem(item, index);
              } else {
                Map<String, dynamic> newItem = {};
                newItem[KEY_NAME] = _nameController.text.toString();
                newItem[KEY_IS_FAVOURITE] = false;
                item.curdController.addItem(newItem);
              }
              Navigator.pop(context,true);
            },
            child: Text(BTN_SAVE),
          ),
          ElevatedButton(onPressed: (){
            Navigator.pop(context,);
          }, child: Text("exit")),
        ],
      ),
    );
  }
}

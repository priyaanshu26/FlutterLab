import '../assets/import_export.dart';

class ListScreen extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RxList Example')),
      body: Obx(() => ListView.builder(
        itemCount: controller.items.length,
        itemBuilder: (_, index) {
          var item = controller.items[index];
          return ListTile(
            title: Text(item['title']),
            trailing: IconButton(
              icon: Icon(
                item['isFav'] ? Icons.favorite : Icons.favorite_border,
                color: item['isFav'] ? Colors.red : null,
              ),
              onPressed: () => controller.toggleFav(index),
            ),
          );
        },
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            child: Icon(Icons.add),
            onPressed: () => controller.addItem('New Item ${DateTime.now().second}'),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'remove',
            backgroundColor: Colors.red,
            child: Icon(Icons.remove),
            onPressed: () {
              if (controller.items.isNotEmpty) {
                controller.deleteItem(controller.items.length - 1);
              }
            },
          ),
        ],
      ),
    );
  }
}

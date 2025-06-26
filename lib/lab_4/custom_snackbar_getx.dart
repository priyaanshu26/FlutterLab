import '../assets/import_export.dart';

class CustomSnackbarGetx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom SnackBar')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  'Top SnackBar',
                  'At the top of the screen',
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.TOP,
                );
              },
              child: Text('Top SnackBar'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.snackbar(
                'Bottom Warning',
                'At the bottom of the screen',
                backgroundColor: Colors.orange,
                colorText: Colors.black,
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: Text('Bottom SnackBar'),
          ),
        ],
      ),
    );
  }
}

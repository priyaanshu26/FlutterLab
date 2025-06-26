import '../assets/import_export.dart';

class DialogGetx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Dialog')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.defaultDialog(
              title: 'Alert!',
              middleText: 'Alert Message Ting Ting Ting.',
              textConfirm: 'OK',
              textCancel: 'Cancel',
              onConfirm: () => Get.back(),
              onCancel: () => Get.back(),
            );
          },
          child: Text('Show Dialog'),
        ),
      ),
    );
  }
}

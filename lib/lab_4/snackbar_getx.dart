import '../assets/import_export.dart';

class SnackBarGetx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX SnackBar')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.snackbar('Success', 'Hii Hello How are you!');
          },
          child: Text('Show SnackBar'),
        ),
      ),
    );
  }
}

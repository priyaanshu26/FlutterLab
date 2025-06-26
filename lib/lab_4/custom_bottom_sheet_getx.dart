import '../assets/import_export.dart';

class CustomBottomSheetGetx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom BottomSheet')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.teal[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: Text('Automatically close'),
                ),
              ),
            );
            Future.delayed(Duration(seconds: 3), () => Get.back());
          },
          child: Text('Show BottomSheet'),
        ),
      ),
    );
  }
}

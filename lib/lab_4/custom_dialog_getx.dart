import '../assets/import_export.dart';

class CustomDialogGetx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Custom Dialog')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.dialog(
              Dialog(
                backgroundColor: Colors.blueGrey[50],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Custom Themed Dialog", style: TextStyle(fontSize: 18)),
                      SizedBox(height: 10),
                      Text("How's this, I have customised this."),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => Get.back(),
                        child: Text("Close"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Text('Show Custom Dialog'),
        ),
      ),
    );
  }
}

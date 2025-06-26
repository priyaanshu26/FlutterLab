import '../assets/import_export.dart';

class SenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sender Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.to(ReceiverScreen(), arguments: "Hello from Sender"),
          child: Text('Send Data'),
        ),
      ),
    );
  }
}

class ReceiverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String data = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Receiver Screen')),
      body: Center(
        child: Text('Received: $data'),
      ),
    );
  }
}

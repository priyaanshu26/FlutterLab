import '../assets/import_export.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();

  void divideAndShow(BuildContext context) {
    try {
      int a = int.parse(aController.text);
      int b = int.parse(bController.text);
      int result = a ~/ b;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Result: $result")),
      );
    } on FormatException {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter valid integers")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: Cannot divide by zero")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exception Demo',
      home: Scaffold(
        appBar: AppBar(title: Text("Try-Catch & Snackbar")),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            TextField(controller: aController, decoration: InputDecoration(labelText: "Enter A")),
            TextField(controller: bController, decoration: InputDecoration(labelText: "Enter B")),
            ElevatedButton(
              onPressed: () => divideAndShow(context),
              child: Text("Divide"),
            )
          ]),
        ),
      ),
    );
  }
}

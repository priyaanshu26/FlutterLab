import '../assets/import_export.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => HomeScreen()),
      GetPage(name: '/details', page: () => DetailScreen()),
    ],
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Named Routing')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.toNamed('/details'),
          child: Text('Go to Detail'),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.back(),
          child: Text('Back to Home'),
        ),
      ),
    );
  }
}

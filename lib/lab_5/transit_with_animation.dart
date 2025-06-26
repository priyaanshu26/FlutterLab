import '../assets/import_export.dart';

void main() {
  runApp(GetMaterialApp(
    home: AnimationScreen1(),
    getPages: [
      GetPage(
        name: '/animated',
        page: () => AnimationScreen2(),
        transition: Transition.zoom, // use slideLeft, rightToLeftWithFade etc.
        transitionDuration: Duration(milliseconds: 600),
      ),
    ],
  ));
}

class AnimationScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation 1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.toNamed('/animated'),
          child: Text('Zoom Transition'),
        ),
      ),
    );
  }
}

class AnimationScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation 2')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.back(),
          child: Text('Back'),
        ),
      ),
    );
  }
}

import '../assets/import_export.dart';

class BottomSheetGetx extends StatelessWidget {
  final List<String> data = ['Hii', 'My name is Priyanshu', 'I am fine', 'Who are you????????'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX BottomSheet')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                color: Colors.white,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(data[index]),
                    onTap: () => Get.back(),
                  ),
                ),
              ),
            );
          },
          child: Text('Show BottomSheet'),
        ),
      ),
    );
  }
}

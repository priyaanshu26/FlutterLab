import '../../assets/import_export.dart';
import '../../util/string_constants.dart';
import 'add_user_controller.dart';

class AddUserView extends StatefulWidget {
  Map? user;
  AddUserView({super.key, this.user = null});

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {

  AddUserController controller = AddUserController();

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      controller.nameController().text = widget.user![Key_Name];
      controller.emailController().text = widget.user![Key_Email];
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(Appbar_Title_Lab_03_Add_User, style: TextStyle(color: Colors.white)),
      ),
      body: Form(
        key: controller.formKey(),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          children: [
            // Name
            TextFormField(
              controller: controller.nameController(),
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: 30),

            // Email
            TextFormField(
              controller: controller.emailController(),
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your Email',
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(height: 30),

            Center(
              child: ElevatedButton(onPressed: () {
                controller.submitForm(context);
              }, child: Text('Submit')),
            )
          ],
        ),

      ),
    );
  }
}

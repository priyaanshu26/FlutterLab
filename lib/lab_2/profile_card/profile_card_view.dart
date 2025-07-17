import 'package:lab/assets/import_export.dart';

import '../../util/import_export.dart';
import '../../util/string_constants.dart';

class ProfileCardView extends StatefulWidget {
  const ProfileCardView({super.key});

  @override
  State<ProfileCardView> createState() => _ProfileCardViewState();
}

class _ProfileCardViewState extends State<ProfileCardView> {

  ProfileCardController controller = ProfileCardController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(Appbar_Title_Lab_02_Profile_Card, style: TextStyle(color: Colors.white),),
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

            // Phone Number
            TextFormField(
              controller: controller.phoneNumberController(),
              decoration: InputDecoration(
                labelText: 'Phone',
                hintText: 'Enter your Phone number',
                border: UnderlineInputBorder(),
              ),
              maxLength: 10,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 30),

            Center(
              child: ElevatedButton(onPressed: () {

                },
                child: Text(Btn_Submit),
              )
            )
          ],
        ),

      ),
    );
  }
}

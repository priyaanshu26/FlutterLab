import '../../assets/import_export.dart';
import '../../util/string_constants.dart';

class AddUserModel{

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');

  void submitForm(BuildContext context) {
    if (formKey.currentState!.validate()) {

      Map newUser = {
        Key_Name: nameController.text,
        Key_Email: emailController.text,
      };

      Navigator.of(context).pop(newUser);
      formKey.currentState!.reset();
    }
  }

}
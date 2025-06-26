import '../../assets/import_export.dart';
import 'add_user_model.dart';

class AddUserController{

  AddUserModel model = AddUserModel();

  GlobalKey<FormState> formKey() => model.formKey;
  TextEditingController nameController() => model.nameController;
  TextEditingController emailController() => model.emailController;

  void submitForm(BuildContext context) => model.submitForm(context);

}
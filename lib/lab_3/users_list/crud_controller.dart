import 'crud_model.dart';


class CrudController{
  CrudModel model = CrudModel();

  void addUser(Map newUser) => model.addUser(newUser);

  void updateUser(int index, Map updatedUser) => model.updateUser(index, updatedUser);

  void deleteUser(int index) => model.deleteUser(index);

  Map getUser(int index) => model.getUser(index);

  List getUserList() => model.getUserList();

}
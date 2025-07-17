class CrudModel{

  List users = [];

  void addUser(Map newUser) {
      users.add(newUser);
  }

  void updateUser(int index, Map updatedUser) {
      users[index] = updatedUser;
  }

  void deleteUser(int index) {
      users.removeAt(index);
  }

  Map getUser(int index) {
    return users[index];
  }

  List getUserList() {
      return users;
  }



}
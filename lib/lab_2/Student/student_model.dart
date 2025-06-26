class StudentModel {
  List<dynamic> studentList = [
    (name: 'Priyanshu Chaudhary', phoneNumber: '8735970956', isFavorite: true),
    (name: 'Ronak Upadhyey', phoneNumber: '9512578654', isFavorite: false),
    (name: 'Vinit Rankja', phoneNumber: '9876543210', isFavorite: true),
    (name: 'Zeel Bhuva', phoneNumber: '9638527410', isFavorite: false),
    (name: 'Rankja', phoneNumber: '9876543210', isFavorite: true),
    (name: 'Vinit', phoneNumber: '9876543210', isFavorite: false),

  ];

  List<dynamic> favouriteList = [];

  void toggleFavoriteList(dynamic student) {
    if (favouriteList.contains(student)) {
      favouriteList.remove(student);
    }else{
      favouriteList.add(student);
    }
  }

  bool isFavouriteListContainsProduct(dynamic student) {
    return favouriteList.contains(student);
  }
}
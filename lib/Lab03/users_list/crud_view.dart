import '../../assets/import_export.dart';
import '../../util/string_constants.dart';
import '../add_user/add_user_view.dart';
import 'crud_controller.dart';

class CrudView extends StatefulWidget {
  const CrudView({super.key});

  @override
  State<CrudView> createState() => _CrudViewState();
}

class _CrudViewState extends State<CrudView> {

  CrudController controller = CrudController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(Appbar_Title_Lab_03, style: TextStyle(color: Colors.white),),
      ),

      body: controller.getUserList().length != 0 ? ListView.builder(
          itemCount: controller.getUserList().length,
          itemBuilder: (context, index) {
            Map user = controller.getUser(index);
            return Card(
              child: ListTile(
                title: Text(user[Key_Name]),
                subtitle: Text(user[Key_Email]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddUserView(user: user,))
                      ).then((newUser) {
                        if (newUser != null) {
                          controller.updateUser(index, newUser);
                          setState(() {});
                        }
                      });
                    }, icon: Icon(Icons.edit)),

                    IconButton(onPressed: () {
                      controller.deleteUser(index);
                      setState(() {});
                    }, icon: Icon(Icons.delete)),
                  ],
                ),
              ),
            );
          }
      ) : Center(child: Text(NO_DATA_FOUND, style: TextStyle(fontSize: 16, color: Colors.grey),)),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddUserView() )
          ).then((newUser) {
            if (newUser != null) {
              controller.addUser(newUser);
              setState(() {});
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

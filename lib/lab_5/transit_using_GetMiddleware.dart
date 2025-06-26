import '../assets/import_export.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => LoginScreen()),
      GetPage(
        name: '/dashboard',
        page: () => DashboardScreen(),
        middlewares: [AuthMiddleware()],
      ),
    ],
  ));
}

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isLoggedIn = false; // Simulate login
    if (!isLoggedIn) {
      return RouteSettings(name: '/');
    }
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.toNamed('/dashboard'),
          child: Text('Try to Go to Dashboard'),
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(child: Text('Welcome to Dashboard')),
    );
  }
}

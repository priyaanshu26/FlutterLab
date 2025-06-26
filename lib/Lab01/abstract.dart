abstract class A {
  void buildMethod();
}


class B extends A {
  @override
  void buildMethod() {
    print("Building...");
  }
}

void main() {
  B b = B();
  b.buildMethod();
}
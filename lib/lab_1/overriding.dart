class A {
  void runMethod() {
    print("runMethod of class A");
  }
}


class B extends A {
  @override
  void runMethod() {
    print("runMethod of class B");
  }
}

void main() {
  A a = A();
  a.runMethod();
  B b = B();
  b.runMethod();
}
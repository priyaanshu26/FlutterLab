class A {
  int a;

  A({this.a = 100});

  void printValue() {
    print("Value of a is $a");
  }
}


class B extends A {
  B(int a){
     super.a = a;
  }
}

void main() {
  B b = B(200);
  b.printValue();
}
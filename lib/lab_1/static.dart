class A {
  static int COUNT = 0;

  void printCount() {
    print("Count: $COUNT");
  }
}

class B extends A {
  void incrementCount() {
    A.COUNT = A.COUNT + 1;
  }
}

class C extends A {
  void incrementCount() {
    A.COUNT = A.COUNT + 1;
  }
}

void main() {
  B b = B();
  C c = C();
  b.incrementCount();
  b.printCount();
  c.incrementCount();
  c.printCount();
}
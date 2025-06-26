abstract class A {
  int a = 10;
  int b = 15;
  void add() {
    print(a + b);
  }
  void sub() {
    print(a - b);
  }
}
class B extends A{
 void add(){
   print(a + b);
 }
}
class C extends B{
  void sub() {
    print(a - b);
  }
}
void main(){
  C obj=new C();
  obj.add();
  obj.sub();
}

class A{
  static int a = 0;
}
class B extends A{
  var b = ++A.a;
}
class C extends B{
  var c = ++A.a;
}
void main(){
  C c = new C();
  print(A.a);
}

class A{
  int a=5;
}
class B extends A{
  void square(){
    print(a*a);
  }
}
class C extends B{
  void square(){
    print(a*a);
  }
}
void main(){
  C obj=new C();
  obj.square();
}
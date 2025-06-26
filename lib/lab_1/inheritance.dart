class A{
  int a=5;
  int b=6;
}
class B extends A{
  void add(){
    print(a+b);
  }
}
class C extends B{
  void multiply(){
    print(a*b);
  }
}
void main(){
  C obj=new C();
  obj.add();
  obj.multiply();
}
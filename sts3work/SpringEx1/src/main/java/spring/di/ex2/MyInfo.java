package spring.di.ex2;

public class MyInfo {

	String name;
	int age;
	String addr;
	
	public MyInfo(String name,int age,String addr) {
		
		this.name=name;
		this.age=age;
		this.addr=addr;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Myinfo [name="+name+", age="+age+", addr="+addr+"]";
	}
}

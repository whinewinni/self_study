package or.whine.mvc.controller;

/**
 * Created by Winni on 2016-09-01.
 */
public class TestClass {

    int a=1;

    void b(){
        a=2;
    }

    public static void main(String[] args) {
        TestClass tc=new TestClass();
        System.out.println(tc.a);

        tc.b();
        System.out.println(tc.a);
    }

}
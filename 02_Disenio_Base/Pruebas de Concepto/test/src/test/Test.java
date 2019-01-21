package test;

import java.util.ArrayList;

/**
 *
 * @author Cesar Cardozo & Gabriel Amaya
 */
public class Test implements iManager{

    public Test() {
    }

    public static ArrayList<Object> getObjectList() {
        return objectList;
    }
    
    @Override
    public boolean add(Object object) {
        this.objectList.add(object);
        return true;
    }
    
    public static void main(String[] args) {
        Test t = new Test();
        t.add("hello world im an Student");
        System.out.println(t.getObjectList().get(0).toString());
    }
}
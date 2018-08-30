package test;

/**
 *
 * @author Cesar Cardozo
 */
public abstract class Rol {

    public boolean grantPermissions() {
        if (this.getClass().getName().equals("test.Administrator")) {
            System.out.println("access granted");
            return true;
        }
        return false;
    }
}

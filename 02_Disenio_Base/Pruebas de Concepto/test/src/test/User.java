package test;

import java.util.ArrayList;

/**
 *
 * @author Cesar Cardozo
 */
public class User {

    private String userName;
    private String email;
    private String password;
    private ArrayList<Rol> roleList;

    public User(String userName, String email, String password, Rol role) {
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.roleList = new ArrayList<>();
        this.roleList.add(role);
    }
    
    public boolean grantPermissions(){
        for (Rol rol : roleList) {
            if (rol.grantPermissions()) {
                return true;
            }
        }
        return false;
    }
    
    public void addRole(Rol Role){
        roleList.add(Role);
    }
    
    public static void main(String[] args) {
        User userTest = new User("Pedro", "pedro@email.com", "pedro123", new Student());
        userTest.addRole(new Administrator());
        userTest.grantPermissions();
    }
}
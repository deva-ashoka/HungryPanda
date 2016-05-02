package authenticate;
import com.mongodb.*;

public class SignUp {

    public static void signUpVendor(String name, String username, String password, String mobile, String outletName){

        String hashPassword = PasswordEncryption.MD5(password);

        Mongo client = new Mongo();
        DB database = client.getDB("Login");
        DBCollection vendorCollection = database.getCollection("Vendors");

        BasicDBObject details = new BasicDBObject("Name", name).append("Username", username).append("Password", hashPassword).append("Mobile", mobile).append("Outlet", outletName);
        vendorCollection.insert(details);

        }

    public static boolean vendorUsernameAlreadyExists(String username){

        boolean check;

        Mongo client = new Mongo();
        DB database = client.getDB("Login");
        DBCollection vendorCollection = database.getCollection("Vendors");

        DBObject query = new BasicDBObject("Username", username);
        DBObject where = vendorCollection.findOne(query);

        if (where != null){
            check = true;
        } else {
            check = false;
        }
        return check;
    }

    public static void signUpCustomer(String name, String username, String password, String mobile, String room){

        String hashPassword = PasswordEncryption.MD5(password);

        Mongo client = new Mongo();
        DB database = client.getDB("Login");
        DBCollection customerCollection = database.getCollection("Customers");

        BasicDBObject details = new BasicDBObject("Name", name).append("Username", username).append("Password", hashPassword).append("Mobile", mobile).append("Room",room);
        customerCollection.insert(details);

    }

    public static boolean customerUsernameAlreadyExists(String username){

        boolean check;

        Mongo client = new Mongo();
        DB database = client.getDB("Login");
        DBCollection customerCollection = database.getCollection("Customers");

        DBObject query = new BasicDBObject("Username", username);
        DBObject where = customerCollection.findOne(query);

        if (where != null){
            check = true;
        } else {
            check = false;
        }
        return check;
    }
}

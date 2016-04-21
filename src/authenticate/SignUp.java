package authenticate;
import com.mongodb.*;

public class SignUp {

    public static void signUpVendor(String name, String email, String password, String mobile, String outletName){

        Mongo client = new Mongo();
        DB database = client.getDB("Login");
        DBCollection vendorCollection = database.getCollection("Vendors");

        BasicDBObject details = new BasicDBObject("Name", name).append("Email", email).append("Password", password).append("Mobile", mobile).append("Outlet", outletName);
        vendorCollection.insert(details);

        }

    public static void signUpCustomer(String name, String email, String password, String mobile, String room){

        Mongo client = new Mongo();
        DB database = client.getDB("Login");
        DBCollection customerCollection = database.getCollection("Customers");

        BasicDBObject details = new BasicDBObject("Name", name).append("Email", email).append("Password", password).append("Mobile", mobile).append("Room",room);
        customerCollection.insert(details);

    }
}

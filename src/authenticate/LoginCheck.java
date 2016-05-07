package authenticate;
import com.mongodb.*;


public class LoginCheck {

    static Mongo client = new Mongo();
    static DB database = client.getDB("Login");


    public static int checkCustomerLogin(String username, String password) {

        int login;
        String hashPassword = PasswordEncryption.MD5(password);

        DBCollection customerCollection = database.getCollection("Customers");
        BasicDBObject query = new BasicDBObject();

        query.put("Username", username);
        query.put("Password", hashPassword);

        BasicDBObject where = new BasicDBObject();
        where.put("$and", query);

        DBObject doc = customerCollection.findOne(query);

        if (doc != null) {
            login = 1;
        } else
            login = 0;
        return login;

    }

    public static int checkVendorLogin(String username, String password){

        int login;
        String hashPassword = PasswordEncryption.MD5(password);

        DBCollection vendorCollection = database.getCollection("Vendors");
        BasicDBObject query=new BasicDBObject();

        query.put("Username", username);
        query.put("Password", hashPassword);

        BasicDBObject where=new BasicDBObject();
        where.put("$and", query);
        DBObject doc = vendorCollection.findOne(query);

        if (doc != null) {
            login = 1;
        } else
            login = 0;
        return login;
    }
}



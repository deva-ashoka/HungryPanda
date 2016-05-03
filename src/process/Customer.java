package process;

import com.mongodb.*;

import java.util.ArrayList;
import java.util.Iterator;

public class Customer {

    public static String getName (String username) {

        String name;

        Mongo client = new Mongo();
        DB database = client.getDB("Login");
        DBCollection customerCollection = database.getCollection("Customers");

        DBObject query = new BasicDBObject("Username", username);
        DBObject where = customerCollection.findOne(query);

        name = where.get("Name").toString();

        return name;
    }

    public static String getMobile (String username) {

        String mobile;

        Mongo client = new Mongo();
        DB database = client.getDB("Login");
        DBCollection customerCollection = database.getCollection("Customers");

        DBObject query = new BasicDBObject("Username", username);
        DBObject where = customerCollection.findOne(query);

        mobile = where.get("Mobile").toString();

        return mobile;
    }


    public static int getEachItemTotal(int price, int quantity){
        int eachItemTotal = price*quantity;
        return eachItemTotal;
    }

    public static  int getTotalBill(ArrayList<Integer> eachItemTotal){
        int totalBill = 0;

        for (int i=0; i<eachItemTotal.size(); i++){
            totalBill += eachItemTotal.get(i);
        }
        return totalBill;
    }

    public static ArrayList getOutlets() {


        Mongo client = new Mongo();
        DB database = client.getDB("Login");
        DBCollection vendorCollection = database.getCollection("Vendors");

        BasicDBObject query = new BasicDBObject();
        BasicDBObject field = new BasicDBObject();
        field.put("Outlet", 1);
        DBCursor cursor = vendorCollection.find(query, field);

        ArrayList outletArr = new ArrayList();
        while (cursor.hasNext()) {
            BasicDBObject obj = (BasicDBObject) cursor.next();
            outletArr.add(obj.getString("Outlet"));
        }
        return outletArr;

    }

}

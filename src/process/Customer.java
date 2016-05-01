package process;

import com.mongodb.*;

import java.util.ArrayList;

public class Customer {

    static int totalBill = 0;

    public static int getEachItemTotal(int price, int quantity){
        int eachItemTotal = price*quantity;
        return eachItemTotal;
    }

    public static  int getTotalBill(int addToTotalBill){
        totalBill += addToTotalBill;
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

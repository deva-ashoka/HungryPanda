package process;

import com.mongodb.*;

import java.util.ArrayList;
import java.util.Iterator;

public class Customer  {

    public static ArrayList<String> getCustomersOrdersOutlets(String username) {

        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection Orders = database.getCollection(username + "MyOrders");
        DBCursor cursorCustomer = Orders.find();

        ArrayList<String> outletArr = new ArrayList<>();

        while (cursorCustomer.hasNext()) {
            String outlet = (String) cursorCustomer.next().get("Outlet");
            outletArr.add(outlet);
        }
        return outletArr;
    }

    public static ArrayList<ArrayList<?>> getCustomerOrdersItemNames(String username) {

        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection Orders = database.getCollection(username + "MyOrders");
        DBCursor cursorNames = Orders.find();

        ArrayList<ArrayList<?>> itemNamesArr = new ArrayList<>();

        while (cursorNames.hasNext()) {
            ArrayList<?> itemNames = (BasicDBList) cursorNames.next().get("Item Name");
            itemNamesArr.add(itemNames);
        }
        return itemNamesArr;
    }

    public static ArrayList<ArrayList<?>> getCustomerOrdersItemPrices(String username) {

        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection Orders = database.getCollection(username + "MyOrders");
        DBCursor cursorPrices = Orders.find();

        ArrayList<ArrayList<?>> itemPricesArr = new ArrayList<>();

        while (cursorPrices.hasNext()) {
            ArrayList<?> itemPrices = (BasicDBList) cursorPrices.next().get("Item Price");
            itemPricesArr.add(itemPrices);
        }
        return itemPricesArr;
    }

    public static ArrayList<ArrayList<?>> getCustomerOrdersQuantity(String username) {

        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection Orders = database.getCollection(username + "MyOrders");
        DBCursor cursorQuantity = Orders.find();

        ArrayList<ArrayList<?>> quantityArr = new ArrayList<>();

        while (cursorQuantity.hasNext()) {
            ArrayList<?> quantity = (BasicDBList) cursorQuantity.next().get("Quantity");
            quantityArr.add(quantity);
        }
        return quantityArr;
    }

    public static ArrayList<ArrayList<?>> getCustomerOrdersItemTotal(String username) {

        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection Orders = database.getCollection(username + "MyOrders");
        DBCursor cursorItemTotal = Orders.find();

        ArrayList<ArrayList<?>> itemTotalArr = new ArrayList<>();

        while (cursorItemTotal.hasNext()) {
            ArrayList<?> itemTotal = (BasicDBList) cursorItemTotal.next().get("Item Total");
            itemTotalArr.add(itemTotal);
        }
        return itemTotalArr;
    }

    public static ArrayList<String> getCustomerOrdersTotalBill(String username) {

        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection Orders = database.getCollection(username + "MyOrders");
        DBCursor cursorTotalBill = Orders.find();

        ArrayList<String> totalBillArr = new ArrayList<>();

        while (cursorTotalBill.hasNext()) {
            String totalBill = cursorTotalBill.next().get("Total Bill").toString();
            totalBillArr.add(totalBill);
        }
        return totalBillArr;
    }

    public static void addToCustomerOrders(String username, String outlet, ArrayList<String> itemName, ArrayList<Integer> itemPrice, ArrayList<Integer> quantity, ArrayList<Integer> itemTotal, int totalBill) {
        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection vendorOrderCollection = database.getCollection(username + "MyOrders");

        BasicDBObject presentOrder = new BasicDBObject("Outlet", outlet).append("Item Name", itemName).append("Item Price", itemPrice).append("Quantity", quantity).append("Item Total", itemTotal).append("Total Bill", totalBill);
        vendorOrderCollection.insert(presentOrder);
    }

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

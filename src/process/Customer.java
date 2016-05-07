package process;

import com.mongodb.*;
import org.bson.types.ObjectId;

import java.util.ArrayList;

public class Customer {

    static Mongo client = new Mongo();
    static DB database = client.getDB("global");
    static DB databaseLogin = client.getDB("Login");

    public static void addVendorOrderIDToMyCollection(String customerUsername, String customerOrderID, String vendorOrderID){

        DBCollection Orders = database.getCollection(customerUsername + "MyOrders");

        DBObject query = new BasicDBObject("_id", new ObjectId(customerOrderID));
        DBObject update = new BasicDBObject();
        update.put("$set", new BasicDBObject("Vendor Order ID", vendorOrderID));

        Orders.update(query, update);

    }

    public static void changeStatusInVendorOrdersPage(String outletName, String vendorOrderID) {

        DBCollection Orders = database.getCollection(outletName + "Orders");

        DBObject query = new BasicDBObject("_id", new ObjectId(vendorOrderID));
        DBObject update = new BasicDBObject();
        update.put("$set", new BasicDBObject("Delivery Status","Received"));

        Orders.update(query, update);
    }

    public static String getVendorOrderID(String outletName, String customerOrderID){

        DBCollection orders = database.getCollection(outletName + "Orders");
        DBObject query = new BasicDBObject("Customer Order ID", customerOrderID);
        DBObject where = orders.findOne(query);

        String vendorOrderID = where.get("_id").toString();

        return  vendorOrderID;

    }

    public static String getLastOrderID(String username){
        String orderID = "";
        DBCollection coll = database.getCollection(username + "MyOrders");
        DBCursor cursor = coll.find();

        while (cursor.hasNext()){
            orderID = cursor.next().get("_id").toString();
        }
        return orderID;
    }

    public static ArrayList<String> getCustomerOrdersVendorOrderIDs(String username) {

        DBCollection Orders = database.getCollection(username + "MyOrders");
        DBCursor cursorVendorOrderIDs = Orders.find();

        ArrayList<String> vendorOrderIDsArr = new ArrayList<>();

        while (cursorVendorOrderIDs.hasNext()) {
            String outlet = (String) cursorVendorOrderIDs.next().get("Vendor Order ID");
            vendorOrderIDsArr.add(outlet);
        }
        return vendorOrderIDsArr;
    }


    public static ArrayList<String> getOrderStatus(String username) {

        DBCollection Orders = database.getCollection(username + "MyOrders");
        DBCursor cursorStatus = Orders.find();

        ArrayList<String> statusArr = new ArrayList<>();

        while (cursorStatus.hasNext()) {
            String outlet = (String) cursorStatus.next().get("Status");
            statusArr.add(outlet);
        }
        return statusArr;
    }

    public static ArrayList<String> getCustomersOrdersOutlets(String username) {

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

        DBCollection vendorOrderCollection = database.getCollection(username + "MyOrders");

        BasicDBObject presentOrder = new BasicDBObject("Outlet", outlet).append("Vendor Order ID", " ").append("Item Name", itemName).append("Item Price", itemPrice).append("Quantity", quantity).append("Item Total", itemTotal).append("Total Bill", totalBill).append("Status", "Not Ready");
        vendorOrderCollection.insert(presentOrder);
    }

    public static String getName (String username) {

        String name;

        DBCollection customerCollection = databaseLogin.getCollection("Customers");

        DBObject query = new BasicDBObject("Username", username);
        DBObject where = customerCollection.findOne(query);

        name = where.get("Name").toString();

        return name;
    }

    public static String getMobile (String username) {

        String mobile;

        DBCollection customerCollection = databaseLogin.getCollection("Customers");

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

        DBCollection vendorCollection = databaseLogin.getCollection("Vendors");

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

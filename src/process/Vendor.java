package process;

import com.mongodb.*;

import java.util.ArrayList;

public class Vendor {


    public static ArrayList<String> getVendorOrdersCustomers(String sessionOutletName) {

        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection Orders = database.getCollection(sessionOutletName + "Orders");
        DBCursor cursorCustomer = Orders.find();

        ArrayList<String> customerArr = new ArrayList<>();

        while (cursorCustomer.hasNext()) {
            String customer = (String) cursorCustomer.next().get("Customer Details");
            customerArr.add(customer);
        }
        return customerArr;
    }

    public static ArrayList<ArrayList<?>> getVendorOrdersItemNames(String sessionOutletName) {

        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection Orders = database.getCollection(sessionOutletName + "Orders");
        DBCursor cursorNames = Orders.find();

        ArrayList<ArrayList<?>> itemNamesArr = new ArrayList<>();

        while (cursorNames.hasNext()) {
            ArrayList<?> itemNames = (BasicDBList) cursorNames.next().get("Item Name");
            itemNamesArr.add(itemNames);
        }
        return itemNamesArr;
    }

    public static ArrayList<ArrayList<?>> getVendorOrdersItemPrices(String sessionOutletName) {

        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection Orders = database.getCollection(sessionOutletName + "Orders");
        DBCursor cursorPrices = Orders.find();

        ArrayList<ArrayList<?>> itemPricesArr = new ArrayList<>();

        while (cursorPrices.hasNext()) {
            ArrayList<?> itemPrices = (BasicDBList) cursorPrices.next().get("Item Price");
            itemPricesArr.add(itemPrices);
        }
        return itemPricesArr;
    }

    public static ArrayList<ArrayList<?>> getVendorOrdersQuantity(String sessionOutletName) {

        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection Orders = database.getCollection(sessionOutletName + "Orders");
        DBCursor cursorQuantity = Orders.find();

        ArrayList<ArrayList<?>> quantityArr = new ArrayList<>();

        while (cursorQuantity.hasNext()) {
            ArrayList<?> quantity = (BasicDBList) cursorQuantity.next().get("Quantity");
            quantityArr.add(quantity);
        }
        return quantityArr;
    }

    public static ArrayList<ArrayList<?>> getVendorOrdersItemTotal(String sessionOutletName) {

        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection Orders = database.getCollection(sessionOutletName + "Orders");
        DBCursor cursorItemTotal = Orders.find();

        ArrayList<ArrayList<?>> itemTotalArr = new ArrayList<>();

        while (cursorItemTotal.hasNext()) {
            ArrayList<?> itemTotal = (BasicDBList) cursorItemTotal.next().get("Item Total");
            itemTotalArr.add(itemTotal);
        }
        return itemTotalArr;
    }

    public static ArrayList<String> getVendorOrdersTotalBill(String sessionOutletName) {

        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection Orders = database.getCollection(sessionOutletName + "Orders");
        DBCursor cursorTotalBill = Orders.find();

        ArrayList<String> totalBillArr = new ArrayList<>();

        while (cursorTotalBill.hasNext()) {
            String totalBill = cursorTotalBill.next().get("Total Bill").toString();
            totalBillArr.add(totalBill);
        }
        return totalBillArr;
    }


    public static void addToVendorOrders(String selectedOutlet, String customer, ArrayList<String> itemName, ArrayList<Integer> itemPrice, ArrayList<Integer> quantity, ArrayList<Integer> itemTotal, int totalBill) {
        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection vendorOrderCollection = database.getCollection(selectedOutlet + "Orders");

        BasicDBObject presentOrder = new BasicDBObject("Customer Details", customer).append("Item Name", itemName).append("Item Price", itemPrice).append("Quantity", quantity).append("Item Total", itemTotal).append("Total Bill", totalBill);
        vendorOrderCollection.insert(presentOrder);
    }

    public static String getOutletName(String username) {

        String outletName;

        Mongo client = new Mongo();
        DB database = client.getDB("Login");
        DBCollection customerCollection = database.getCollection("Vendors");

        DBObject query = new BasicDBObject("Username", username);
        DBObject where = customerCollection.findOne(query);

        outletName = where.get("Outlet").toString();

        return outletName;
    }

    public static String getVendorName(String username) {

        String vendorName;

        Mongo client = new Mongo();
        DB database = client.getDB("Login");
        DBCollection customerCollection = database.getCollection("Vendors");

        DBObject query = new BasicDBObject("Username", username);
        DBObject where = customerCollection.findOne(query);

        vendorName = where.get("Name").toString();

        return vendorName;
    }

    public static ArrayList getItemNames(String outletName) {


        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection Menu = database.getCollection(outletName + "menu");

        BasicDBObject queryName = new BasicDBObject();
        BasicDBObject fieldName = new BasicDBObject();
        fieldName.put("Item Name", 1);
        DBCursor cursorName = Menu.find(queryName, fieldName);
        ArrayList itemNameArr = new ArrayList();
        while (cursorName.hasNext()) {
            BasicDBObject objName = (BasicDBObject) cursorName.next();
            itemNameArr.add(objName.getString("Item Name"));
        }
        return itemNameArr;
    }

    public static ArrayList getItemPrices(String outletName) {

        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection Menu = database.getCollection(outletName + "menu");

        BasicDBObject queryPrice = new BasicDBObject();
        BasicDBObject fieldPrice = new BasicDBObject();
        fieldPrice.put("Price", 1);
        DBCursor cursorPrice = Menu.find(queryPrice, fieldPrice);
        ArrayList priceArr = new ArrayList();
        while (cursorPrice.hasNext()) {
            BasicDBObject objPrice = (BasicDBObject) cursorPrice.next();
            priceArr.add(objPrice.getString("Price"));
        }
        return priceArr;
    }

    public static void addToMenu(String itemName, String itemPrice, String outletName) {

        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection Menu = database.getCollection(outletName + "menu");

        BasicDBObject details = new BasicDBObject("Item Name", itemName).append("Price", itemPrice);
        Menu.insert(details);

    }

}



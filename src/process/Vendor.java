package process;

import com.mongodb.*;

import java.util.ArrayList;

public class Vendor {

    public static String getOutletName (String username) {

        String outletName;

        Mongo client = new Mongo();
        DB database = client.getDB("Login");
        DBCollection customerCollection = database.getCollection("Vendors");

        DBObject query = new BasicDBObject("Username", username);
        DBObject where = customerCollection.findOne(query);

        outletName = where.get("Outlet").toString();

        return outletName;
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

    public static void addToMenu (String itemName, String itemPrice, String outletName){

        Mongo client = new Mongo();
        DB database = client.getDB("global");
        DBCollection Menu = database.getCollection(outletName+"menu");

        BasicDBObject details = new BasicDBObject("Item Name", itemName).append("Price", itemPrice);
        Menu.insert(details);

    }

}
//  } catch(Exception e){
//  System.err.println("Error");


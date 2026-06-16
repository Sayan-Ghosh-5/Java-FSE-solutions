package Exercise1;

import jdk.dynalink.beans.StaticClass;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class InventoryManager{
    // HashMap to store the inventory. Key: productId, Value: Product object
    private Map<String, Product> inventory;

    public InventoryManager() {
        this.inventory = new ConcurrentHashMap<>();
    }
    //add products
    public void addProduct(Product product){
        if(inventory.containsKey(product.getProductId())){
            System.out.println("Product ID already exists. Use update instead.");
            return;
        }
        inventory.put(product.getProductId(), product);
        System.out.println("Product successfully added");
    }

    //update; modify existing
    public void updateProduct(String productId, int newQuantity, double newPrice){
        if(inventory.containsKey(productId)){
            Product product = inventory.get(productId);
            product.setQuantity(newQuantity);
            product.setPrice(newPrice);
            System.out.println("Product updated successfully.");
        } else {
            System.out.println("Product not found.");
        }
    }

    // DELETE: Remove product from inventory
    public void deleteProduct(String productId) {
        if (inventory.remove(productId) != null) {
            System.out.println("Product deleted successfully.");
        } else {
            System.out.println("Product not found.");
        }
    }
}
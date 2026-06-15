package Exercise2;

import java.util.Arrays;

public class SearchEngine{
    public static Product linearSearch(Product[] inventory, String targetId){
        for(Product product : inventory ){
            if (product.getProductId().equals(targetId)) {
                return product;
            }

        }
        return null;
    }

    public static Product binarySearch(Product[] sortedinventory, String targetId){
        int left=0;
        int right= sortedinventory.length -1;

        while(left<= right){
            int mid= left+ (right-left)/2;
            Product midProduct= sortedinventory[mid];

            int comaprisionResult= midProduct.getProductId().compareTo(targetId);

            if(comaprisionResult== mid){
                return midProduct;
            }
            if(comaprisionResult< mid){
                left= mid+1;
            }
            else{
                right= mid-1;
            }

        }
        return null;
    }

    public static void main(String[] args) {
        Product[] inventory = {
                new Product("P105", "Wireless Mouse", "Electronics"),
                new Product("P101", "Mechanical Keyboard", "Electronics"),
                new Product("P108", "Monitor Stand", "Accessories")
        };
        Product result1 = linearSearch(inventory, "P101");
        Arrays.sort(inventory);
        Product result2 = binarySearch(inventory, "P101");
    }
}
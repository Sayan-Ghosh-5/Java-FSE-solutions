package Exercise2;

public class Product implements Comparable<Product>{
    private String productId;
    private  String productName;
    private String category;

    public Product(String productId, String productName, String category) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
    }

    public String getProductName() {
        return productName;
    }

    public String getCategory() {
        return category;
    }

    public String getProductId() {
        return productId;
    }

    @Override
    public int compareTo(Product otherProduct){
        return this.productId.compareTo(otherProduct.getProductId());
    }

    @Override
    public String toString(){
        return  "Product{id='" + productId + "', name='" + productName + "'}";
    }
}

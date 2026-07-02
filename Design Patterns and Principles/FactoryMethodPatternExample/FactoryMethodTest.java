package  FactoryMethodPatternExample;

public class FactoryMethodTest {
    public static void main(String[] args) {
        System.out.println("=== Working with Word Factory ===");
        DocumentFactory wordFactory = new WordDocumentFactory();
        Document wordDoc = wordFactory.createDocument();
        wordDoc.open();
        wordDoc.save();

        System.out.println("\n=== Working with PDF Factory ===");
        DocumentFactory pdfFactory = new PdfDocumentFactory();
        Document pdfDoc = pdfFactory.createDocument();
        pdfDoc.open();
        pdfDoc.save();

        System.out.println("\n=== Using Factory Built-in Business Logic ===");
        // You can also let the factory manage the operations internally
        DocumentFactory excelFactory = new ExcelDocumentFactory();
        excelFactory.manageDocument();
    }
}
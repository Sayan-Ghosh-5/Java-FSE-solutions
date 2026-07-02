package  FactoryMethodPatternExample;

// Abstract Factory Base
public abstract class DocumentFactory {
    // The Factory Method
    public abstract Document createDocument();

    // Factories can also contain business logic that operates on products
    public void manageDocument() {
        Document doc = createDocument();
        doc.open();
        doc.save();
    }
}

// Concrete Factory for Word
class WordDocumentFactory extends DocumentFactory {
    @Override
    public Document createDocument() {
        return new WordDocument();
    }
}

// Concrete Factory for PDF
class PdfDocumentFactory extends DocumentFactory {
    @Override
    public Document createDocument() {
        return new PdfDocument();
    }
}

// Concrete Factory for Excel
class ExcelDocumentFactory extends DocumentFactory {
    @Override
    public Document createDocument() {
        return new ExcelDocument();
    }
}

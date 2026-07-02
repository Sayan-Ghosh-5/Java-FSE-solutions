package  FactoryMethodPatternExample;

// Word Document Implementation
class WordDocument implements Document {
    @Override
    public void open() {
        System.out.println("Opening Word Document... (.docx)");
    }

    @Override
    public void save() {
        System.out.println("Saving progress to Word Document.");
    }
}

// PDF Document Implementation
class PdfDocument implements Document {
    @Override
    public void open() {
        System.out.println("Opening PDF Document... (.pdf) [Read Only]");
    }

    @Override
    public void save() {
        System.out.println("Exporting and saving as PDF Document.");
    }
}

// Excel Document Implementation
class ExcelDocument implements Document {
    @Override
    public void open() {
        System.out.println("Opening Excel Spreadsheet... (.xlsx)");
    }

    @Override
    public void save() {
        System.out.println("Saving rows and columns to Excel Sheet.");
    }
}
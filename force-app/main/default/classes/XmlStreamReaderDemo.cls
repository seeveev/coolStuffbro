global class XmlStreamReaderDemo {

        // Create a class Book for processing 

global class Book {
    webservice String name;
    webservice String author;
    }

    Book[] parseBooks(XmlStreamReader reader) {
    Book[] books = new Book[0];
    while(reader.hasNext()) {

            // Start at the beginning of the book and make sure that it is a book 

        if (reader.getEventType() == XmlTag.START_ELEMENT) {
        if ('Book' == reader.getLocalName()) {
        
            // Pass the book to the parseBook method (below)  
        
        Book book = parseBook(reader);
        books.add(book);
        }
        }
        reader.next();
        }
        return books;
        }
        
        // Parse through the XML, deterimine the auther and the characters 
        
        Book parseBook(XmlStreamReader reader) {
        Book book = new Book();
        book.author = reader.getAttributeValue(null, 'author');
        while(reader.hasNext()) {
        if (reader.getEventType() == XmlTag.END_ELEMENT) {
        break;
        } else if (reader.getEventType() == XmlTag.CHARACTERS) {
        book.name = reader.getText();
        }
        reader.next();
        }
        return book;
        }
        }
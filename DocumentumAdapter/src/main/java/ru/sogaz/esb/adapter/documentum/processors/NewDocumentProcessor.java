package ru.sogaz.esb.adapter.documentum.processors;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import ru.sogaz.esb.adapter.documentum.model.Document;
import ru.sogaz.esb.adapter.documentum.model.Property;

import java.io.File;
import java.util.List;

/**
 * @author DNAvetik
 * 02.03.2018.
 */
public class NewDocumentProcessor implements Processor {

    @Override
    public void process(Exchange exchange) throws Exception {
        File file = exchange.getIn().getBody(File.class);
        exchange.getIn().setHeader("file", file);

        String[] fileParts = file.getName().split("[.]");
        exchange.getIn().setHeader("fileFormat", fileParts[fileParts.length-1]);

        Document document = new Document();
        List<Property> properties = document.getProperties();
        Property property = new Property();
        property.setObjectName(file.getName());
        property.setObjectType("dm_document");
        properties.add(property);
        exchange.getIn().setBody(document);
    }
}

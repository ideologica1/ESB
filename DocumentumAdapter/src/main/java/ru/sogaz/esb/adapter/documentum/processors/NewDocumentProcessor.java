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
        exchange.setProperty("file", file);

        String[] fileParts = file.getName().split("[.]");
        exchange.getIn().setHeader("fileFormat", fileParts[fileParts.length-1]);

        Document document = new Document();
        Property properties = document.getProperties();
        properties.setObjectName(file.getName());
        properties.setObjectType("dm_document");
        exchange.getIn().setBody(document);
    }
}

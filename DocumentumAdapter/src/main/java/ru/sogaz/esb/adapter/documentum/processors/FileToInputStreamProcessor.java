package ru.sogaz.esb.adapter.documentum.processors;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;

import java.io.File;
import java.io.FileInputStream;

/**
 * @author DNAvetik
 * 02.03.2018.
 */
public class FileToInputStreamProcessor implements Processor {

    @Override
    public void process(Exchange exchange) throws Exception {
        File file = exchange.getProperty("file", File.class);
        exchange.getIn().setBody(new FileInputStream(file));
    }
}

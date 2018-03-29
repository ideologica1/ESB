package ru.sogaz.esb.adapter.email.processors;

import com.sun.mail.util.BASE64DecoderStream;
import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.cxf.helpers.IOUtils;

import javax.activation.DataHandler;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.mail.util.ByteArrayDataSource;
import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author DNAvetik
 * 01.03.2018.
 */
public class AttachmentProcessor implements Processor {

    Logger logger = Logger.getAnonymousLogger();
    public void process(Exchange exchange) throws Exception {
        String string = exchange.getIn().getBody(String.class);
        exchange.getIn().addAttachment("message_h.html", new DataHandler(string, "text/html"));
        Map<String, DataHandler> attachments = exchange.getIn().getAttachments();
        List<File> fileList = new ArrayList<>();
        String basePath = System.getProperty("java.io.tmpdir") + File.separator + System.currentTimeMillis();
        exchange.getIn().setHeader("attachmentPath", basePath);
        new File(basePath).mkdirs();

        for (String key : attachments.keySet()) {
            if (MimeUtility.decodeText(key).equalsIgnoreCase("message.xml")) {
                InputStreamReader br = new InputStreamReader((BASE64DecoderStream) attachments.get(key).getContent());
                exchange.getIn().setBody(IOUtils.toString(br));
            } else {
                String path = basePath + File.separator + MimeUtility.decodeText(key);
                File tmp = new File(path);
                FileOutputStream tmpOut = new FileOutputStream(tmp);
                attachments.get(key).writeTo(tmpOut);
                tmpOut.close();
                fileList.add(tmp);
            }
        }
        exchange.getIn().setHeader("attachments", fileList);
    }
}

package ru.sogaz.esb.adapter.email.processors;

import com.sun.mail.util.BASE64DecoderStream;
import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.cxf.helpers.IOUtils;
import ru.sogaz.esb.adapter.email.NoMessageXmlException;

import javax.activation.DataHandler;
import javax.mail.internet.MimeUtility;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MessageProcessor implements Processor {

    public void process(Exchange exchange) throws Exception {

        Map<String, DataHandler> attachments = exchange.getIn().getAttachments();
        boolean isMessageCorrect = false;
        for (String key : attachments.keySet()) {
            if (MimeUtility.decodeText(key).equalsIgnoreCase("message.xml")) {
                InputStreamReader br = new InputStreamReader((BASE64DecoderStream) attachments.get(key).getContent());
                exchange.getIn().setBody(IOUtils.toString(br));
                isMessageCorrect = true;
            }
        }
        if (!isMessageCorrect)
        throw new NoMessageXmlException("message.xml file wrong or absent");
    }
}

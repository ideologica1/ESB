package ru.sogaz.esb.adapter.documentum.aggregation;

import org.apache.camel.Exchange;
import org.apache.camel.processor.aggregate.AggregationStrategy;

import java.util.ArrayList;
import java.util.List;

/**
 * @author DNAvetik
 * 02.03.2018.
 */
public class LinkAggregationStrategy implements AggregationStrategy {

    @Override
    public Exchange aggregate(Exchange oldExchange, Exchange newExchange) {
        if (oldExchange == null) {
            List<String> links = new ArrayList<>();
            links.add(newExchange.getIn().getHeader("link", String.class));
            newExchange.getIn().setBody(links);
            return newExchange;

        } else {
            List<String> links = oldExchange.getIn().getBody(List.class);

            if (null == links) {
                links = new ArrayList<>();
            }

            links.add(newExchange.getIn().getHeader("link", String.class));
            oldExchange.getIn().setBody(links);
            return oldExchange;
        }
    }
}

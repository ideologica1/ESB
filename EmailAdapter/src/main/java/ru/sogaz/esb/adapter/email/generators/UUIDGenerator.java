package ru.sogaz.esb.adapter.email.generators;

import org.springframework.stereotype.Component;

import java.util.UUID;

/**
 * @author DNAvetik
 * 14.08.17.
 */
@Component("uuidGenerator")
public class UUIDGenerator {

    public String getUUID() {
        return UUID.randomUUID().toString();
    }
}

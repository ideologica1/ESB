package ru.sogaz.esb.adapter.email;


public class NoMessageXmlException extends Exception {
    public NoMessageXmlException() {
    }

    public NoMessageXmlException(String message) {
        super(message);
    }

    public NoMessageXmlException(String message, Throwable cause) {
        super(message, cause);
    }

    public NoMessageXmlException(Throwable cause) {
        super(cause);
    }
}

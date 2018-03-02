package ru.sogaz.esb.configurations;

import static java.lang.System.getProperty;


public class Config {
    private static final int REFRESH_CFG_DELAY = 5_000;

    private static final String ROOT_DIR = getProperty("user.dir") + "/config";
    private static final String esbConfigFile = ROOT_DIR + "/" + "esb.xml";

    public static EsbConfiguration getEsbConfiguration() {
        return new EsbConfiguration(esbConfigFile, REFRESH_CFG_DELAY);
    }

}

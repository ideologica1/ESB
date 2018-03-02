package ru.sogaz.esb.configurations;

import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.HierarchicalConfiguration;
import org.apache.commons.configuration.XMLConfiguration;
import org.apache.commons.configuration.reloading.FileChangedReloadingStrategy;
import ru.sogaz.esb.configurations.type.ConfigCredentialType;
import ru.sogaz.esb.configurations.type.ConfigEndpointType;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import static java.lang.System.currentTimeMillis;

/**
 * @author dnavetik
 */
abstract class AbstractConfiguration {

    private Logger _log = null;

    private final String cfgFilePath;
    private final int refreshDelay;

    private XMLConfiguration conf = null;
    private long nextRenewTime = - 1;

    private final String WrongConfigFileMsg;

    AbstractConfiguration(String cfgFilePath, int refreshDelay) {
        _log = Logger.getAnonymousLogger();
        this.cfgFilePath = cfgFilePath;
        WrongConfigFileMsg = "Configuration in " + cfgFilePath + "  wrong or absent.";
        this.refreshDelay = refreshDelay;
        initCfg();
    }

    private synchronized void setXmlCfg(XMLConfiguration conf) {
        this.conf = conf;
    }

    private void initCfg() {
        try {
            _log.log(Level.INFO, "Get configuration [file={0}]", cfgFilePath);
            XMLConfiguration tmpConf = new XMLConfiguration(cfgFilePath);
            FileChangedReloadingStrategy fcs = new FileChangedReloadingStrategy();
            fcs.setRefreshDelay(refreshDelay);
            tmpConf.setReloadingStrategy(fcs);
            tmpConf.setThrowExceptionOnMissing(true);
            setXmlCfg(tmpConf);
        } catch (ConfigurationException ex) {
            _log.log(Level.SEVERE, "{0} Default value used if it possible. [exception={1}]", new Object[]{WrongConfigFileMsg, ex.getMessage()});
        }
    }

    private void renewCfg() {

        if (conf != null) {
            return;
        }
        long now = currentTimeMillis();
        if (nextRenewTime >= now) {
            return;
        }
        nextRenewTime = now + refreshDelay;

    }

    String getString(String key, String defaultValue) {

        renewCfg();

        if (conf == null) {
            return defaultValue;
        }

        return conf.getString(key, defaultValue);

    }

    List getList(String key, List defaultValue) {

        renewCfg();

        if (conf == null) {
            return defaultValue;
        }

        return conf.getList(key, defaultValue);

    }

    int getInt(String key, int defaultValue) {

        renewCfg();

        if (conf == null) {
            return defaultValue;
        }

        return conf.getInt(key, defaultValue);

    }

    long getLong(String key, int defaultValue) {

        renewCfg();

        if (conf == null) {
            return defaultValue;
        }

        return conf.getLong(key, defaultValue);

    }

    boolean getBoolean(String key, boolean defaultValue) {

        renewCfg();

        if (conf == null) {
            return defaultValue;
        }

        return conf.getBoolean(key, defaultValue);

    }

    ConfigEndpointType getURL(String key) {
        renewCfg();

        ConfigEndpointType url = new ConfigEndpointType();
        url.setEndpoint(conf.getString(key.concat("[@endpoint]"), ""));
        url.setCredential(getCredential(key));
        url.setConnectionTimeout(conf.getInt(key.concat("[@connectionTimeout]"), 5_000));
        url.setTimeout(conf.getInt(key.concat("[@timeout]"), 60_000));
        url.setHost(conf.getString(key.concat("[@host]"), ""));
        url.setPort(conf.getString(key.concat("[@port]"), ""));
        return url;
    }

    ConfigCredentialType getCredential(String key) {
        renewCfg();

        ConfigCredentialType credential = new ConfigCredentialType();
        credential.setLogin(conf.getString(key.concat("[@login]"), ""));
        credential.setPassword(conf.getString(key.concat("[@password]"), ""));

        return credential;
    }

    double getDouble(String key, double defaultValue) {
        renewCfg();

        if (conf == null) {
            return defaultValue;
        }

        return conf.getDouble(key, defaultValue);
    }

    List<ConfigEndpointType> getEndpointList(String key) {
        List<ConfigEndpointType> result = new ArrayList<>();
        List q = conf.configurationsAt(key);
        for (Iterator iter = q.iterator(); iter.hasNext(); ) {
            HierarchicalConfiguration sub = (HierarchicalConfiguration) iter.next();

            ConfigEndpointType url = new ConfigEndpointType();
            url.setEndpoint(sub.getString(key.concat("[@endpoint]"), ""));
            url.setCredential(getCredential(key));
            url.setConnectionTimeout(sub.getInt(key.concat("[@connectionTimeout]"), 5_000));
            url.setTimeout(sub.getInt(key.concat("[@timeout]"), 60_000));
            url.setHost(sub.getString(key.concat("[@host]"), ""));
            url.setPort(sub.getString(key.concat("[@port]"), ""));
            result.add(url);
        }
        return result;
    }

    List<String> getStringList(String key) {
        List<String> result = new ArrayList<>();
        List<HierarchicalConfiguration> MsisdnList = conf.configurationsAt(key);
        for (HierarchicalConfiguration sub : MsisdnList) {
            result.add(sub.getString("."));
        }
        return result;
    }
}

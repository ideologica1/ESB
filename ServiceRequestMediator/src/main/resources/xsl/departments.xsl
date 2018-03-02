<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!--
Здесь определена трансформация наименований подразделений
Для вызова использовать обращение вида:

<xsl:call-template name="siebel_dep_name">
    <xsl:with-param name="web_dep_name" select="message/branch/name_branch"/>
</xsl:call-template>
-->

    <xsl:template name="siebel_dep_name">
        <xsl:param name="web_dep_name"></xsl:param>
        <xsl:choose>
            <xsl:when test="$web_dep_name='Западный филиал (г.Калининград)'">Западный филиал</xsl:when>
            <xsl:when test="$web_dep_name='Бурятский филиал (г.Улан-Удэ)'">Бурятский филиал</xsl:when>
            <xsl:when test="$web_dep_name='Дальневосточный филиал (г.Владивосток)'">Дальневосточный филиал</xsl:when>
            <xsl:when test="$web_dep_name='Амурский филиaл (г.Комсомольск-на-Амуре)'">Амурский филиал</xsl:when>
            <xsl:when test="$web_dep_name='Нижне-Волжский филиал (г.Волгоград)'">Нижне-Волжский филиал</xsl:when>
            <xsl:when test="$web_dep_name='Центральный филиал (г. Москва)'">Центральный филиал</xsl:when>
            <xsl:when test="$web_dep_name='Подмосковный филиал (г.Москва)'">Подмосковный филиал</xsl:when>
            <xsl:when test="$web_dep_name='Головной филиал'">Головной офис</xsl:when>
            <xsl:when test="string($web_dep_name)=''">Головной офис</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$web_dep_name"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Перевод сообщений в другой филиал, при необходимости -->
    <xsl:template name="dep_reroute">
        <xsl:param name="dep_id"></xsl:param>
        <xsl:choose>
            <xsl:when test="$dep_id='181'">180</xsl:when> <!-- Новокузнецк -> Кемерово -->
            <xsl:otherwise>
                <xsl:value-of select="$dep_id"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="kasko_region_corr">
        <xsl:apply-templates select="message/calculation/form"/>
    </xsl:template>

    <xsl:template match="form">
        <contract_site_corr>
            <name>Contract Site</name>
            <value>
                <xsl:choose>
                    <!-- замена филиала по региону -->
                    <!-- начало вставки собранных в Excel строк -->
                    <xsl:when test="param[1]/value='280' or param[1]/value='1471'">Красноярский филиал</xsl:when>
                    <xsl:when test="param[1]/value='281' or param[1]/value='1472'">Иркутский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1261' or param[1]/value='1576'">Екатеринбургский филиал</xsl:when>
                    <xsl:when test="param[1]/value='282' or param[1]/value='1473'">Дальневосточный филиал</xsl:when>
                    <xsl:when test="param[1]/value='283' or param[1]/value='1474'">Архангельский филиал</xsl:when>
                    <xsl:when test="param[1]/value='284' or param[1]/value='1475'">Астраханский филиал</xsl:when>
                    <xsl:when test="param[1]/value='285' or param[1]/value='1476'">Саратовский филиал</xsl:when>
                    <xsl:when test="param[1]/value='286' or param[1]/value='1477'">Томский филиал</xsl:when>
                    <xsl:when test="param[1]/value='287' or param[1]/value='1478'">Белгородский филиал</xsl:when>
                    <xsl:when test="param[1]/value='288' or param[1]/value='1479'">Новосибирский филиал</xsl:when>
                    <xsl:when test="param[1]/value='289' or param[1]/value='1480'">Дальневосточный филиал</xsl:when>
                    <xsl:when test="param[1]/value='290' or param[1]/value='1481'">Иркутский филиал</xsl:when>
                    <xsl:when test="param[1]/value='291' or param[1]/value='1482'">Брянский филиал</xsl:when>
                    <xsl:when test="param[1]/value='292' or param[1]/value='1483'">Ставропольский филиал</xsl:when>
                    <xsl:when test="param[1]/value='293' or param[1]/value='1484'">Оренбургский филиал</xsl:when>
                    <xsl:when test="param[1]/value='294' or param[1]/value='1485'">Новгородский филиал</xsl:when>
                    <xsl:when test="param[1]/value='295' or param[1]/value='1486'">Череповецкий филиал</xsl:when>
                    <xsl:when test="param[1]/value='296' or param[1]/value='1487'">Дальневосточный филиал</xsl:when>
                    <xsl:when test="param[1]/value='297' or param[1]/value='1488'">Ярославский филиал</xsl:when>
                    <xsl:when test="param[1]/value='298' or param[1]/value='1489'">Нижне-Волжский филиал</xsl:when>
                    <xsl:when test="param[1]/value='299' or param[1]/value='1490'">Ростовский филиал</xsl:when>
                    <xsl:when test="param[1]/value='300' or param[1]/value='1491'">Нижне-Волжский филиал</xsl:when>
                    <xsl:when test="param[1]/value='301' or param[1]/value='1492'">Вологодский филиал</xsl:when>
                    <xsl:when test="param[1]/value='302' or param[1]/value='1493'">Сыктывкарский филиал</xsl:when>
                    <xsl:when test="param[1]/value='303' or param[1]/value='1494'">Воронежский филиал</xsl:when>
                    <xsl:when test="param[1]/value='304' or param[1]/value='1495'">Чайковский филиал</xsl:when>
                    <xsl:when test="param[1]/value='305' or param[1]/value='1496'">Ленинградский областной филиал
                    </xsl:when>
                    <xsl:when test="param[1]/value='306' or param[1]/value='1497'">Чайковский филиал</xsl:when>
                    <xsl:when test="param[1]/value='307' or param[1]/value='1498'">Нефтеюганский филиал</xsl:when>
                    <xsl:when test="param[1]/value='308' or param[1]/value='1499'">Центральный филиал</xsl:when>
                    <xsl:when test="param[1]/value='309' or param[1]/value='1500'">Нижегородский филиал</xsl:when>
                    <xsl:when test="param[1]/value='310' or param[1]/value='1501'">Екатеринбургский филиал</xsl:when>
                    <xsl:when test="param[1]/value='311' or param[1]/value='1502'">Красноярский филиал</xsl:when>
                    <xsl:when test="param[1]/value='312' or param[1]/value='1503'">Головной офис</xsl:when>
                    <xsl:when test="param[1]/value='313' or param[1]/value='1504'">Екатеринбургский филиал</xsl:when>
                    <xsl:when test="param[1]/value='314' or param[1]/value='1505'">Ярославский филиал</xsl:when>
                    <xsl:when test="param[1]/value='315' or param[1]/value='1506'">Ижевский филиал</xsl:when>
                    <xsl:when test="param[1]/value='316' or param[1]/value='1507'">Сыктывкарский филиал</xsl:when>
                    <xsl:when test="param[1]/value='317' or param[1]/value='1508'">Иркутский филиал</xsl:when>
                    <xsl:when test="param[1]/value='318' or param[1]/value='1509'">Нижегородский филиал</xsl:when>
                    <xsl:when test="param[1]/value='319' or param[1]/value='1510'">Казанский филиал</xsl:when>
                    <xsl:when test="param[1]/value='320' or param[1]/value='1511'">Западный филиал</xsl:when>
                    <xsl:when test="param[1]/value='321' or param[1]/value='1512'">Калужский филиал</xsl:when>
                    <xsl:when test="param[1]/value='322' or param[1]/value='1513'">Нижне-Волжский филиал</xsl:when>
                    <xsl:when test="param[1]/value='323' or param[1]/value='1514'">Кемеровский филиал</xsl:when>
                    <xsl:when test="param[1]/value='324' or param[1]/value='1515'">Сыктывкарский филиал</xsl:when>
                    <xsl:when test="param[1]/value='325' or param[1]/value='1516'">Амурский филиал</xsl:when>
                    <xsl:when test="param[1]/value='326' or param[1]/value='1517'">Южно-Сахалинский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1734' or param[1]/value='1739'">Санкт-Петербургский филиал
                    </xsl:when>
                    <xsl:when test="param[1]/value='327' or param[1]/value='1518'">Ярославский филиал</xsl:when>
                    <xsl:when test="param[1]/value='328' or param[1]/value='1519'">Краснодарский филиал</xsl:when>
                    <xsl:when test="param[1]/value='329' or param[1]/value='1520'">Красноярский филиал</xsl:when>
                    <xsl:when test="param[1]/value='330' or param[1]/value='1521'">Чайковский филиал</xsl:when>
                    <xsl:when test="param[1]/value='331' or param[1]/value='1522'">Екатеринбургский филиал</xsl:when>
                    <xsl:when test="param[1]/value='332' or param[1]/value='1523'">Курский филиал</xsl:when>
                    <xsl:when test="param[1]/value='333' or param[1]/value='1524'">Центральный филиал</xsl:when>
                    <xsl:when test="param[1]/value='334' or param[1]/value='1525'">Липецкий филиал</xsl:when>
                    <xsl:when test="param[1]/value='1211' or param[1]/value='1526'">Челябинский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1212' or param[1]/value='1527'">Центральный филиал</xsl:when>
                    <xsl:when test="param[1]/value='1213' or param[1]/value='1528'">Подмосковный филиал</xsl:when>
                    <xsl:when test="param[1]/value='1214' or param[1]/value='1529'">Ноябрьский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1215' or param[1]/value='1530'">Мурманский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1216' or param[1]/value='1531'">Надымский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1217' or param[1]/value='1532'">Дальневосточный филиал</xsl:when>
                    <xsl:when test="param[1]/value='1218' or param[1]/value='1533'">Уфимский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1219' or param[1]/value='1534'">Нефтеюганский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1220' or param[1]/value='1535'">Нижневартовский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1221' or param[1]/value='1536'">Нижегородский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1222' or param[1]/value='1537'">Екатеринбургский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1223' or param[1]/value='1538'">Воронежский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1224' or param[1]/value='1539'">Кемеровский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1225' or param[1]/value='1540'">Краснодарский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1226' or param[1]/value='1541'">Новосибирский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1227' or param[1]/value='1542'">Екатеринбургский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1228' or param[1]/value='1543'">Новоуренгойский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1229' or param[1]/value='1544'">Ноябрьский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1731' or param[1]/value='1736'">Югорский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1230' or param[1]/value='1545'">Томский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1231' or param[1]/value='1546'">Орловский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1232' or param[1]/value='1547'">Оренбургский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1233' or param[1]/value='1548'">Оренбургский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1234' or param[1]/value='1549'">Саратовский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1235' or param[1]/value='1550'">Пермский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1236' or param[1]/value='1551'">Карельский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1237' or param[1]/value='1552'">Санкт-Петербургский филиал
                    </xsl:when>
                    <xsl:when test="param[1]/value='1238' or param[1]/value='1553'">Псковский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1239' or param[1]/value='1554'">Ставропольский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1240' or param[1]/value='1555'">Екатеринбургский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1241' or param[1]/value='1556'">Ростовский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1242' or param[1]/value='1557'">Ярославский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1243' or param[1]/value='1558'">Рязанский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1244' or param[1]/value='1559'">Уфимский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1245' or param[1]/value='1560'">Самарский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1246' or param[1]/value='1561'">Санкт-Петербургский филиал
                    </xsl:when>
                    <xsl:when test="param[1]/value='1732' or param[1]/value='1737'">Уфимский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1247' or param[1]/value='1562'">Саратовский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1248' or param[1]/value='1563'">Нижегородский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1249' or param[1]/value='1564'">Томский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1250' or param[1]/value='1565'">Центральный филиал</xsl:when>
                    <xsl:when test="param[1]/value='1251' or param[1]/value='1566'">Западный филиал</xsl:when>
                    <xsl:when test="param[1]/value='1252' or param[1]/value='1567'">Пермский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1253' or param[1]/value='1568'">Санкт-Петербургский филиал
                    </xsl:when>
                    <xsl:when test="param[1]/value='1254' or param[1]/value='1569'">Краснодарский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1255' or param[1]/value='1570'">Ставропольский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1256' or param[1]/value='1571'">Уфимский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1257' or param[1]/value='1572'">Томский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1258' or param[1]/value='1573'">Сургутский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1259' or param[1]/value='1574'">Самарский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1260' or param[1]/value='1575'">Сыктывкарский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1262' or param[1]/value='1577'">Ростовский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1263' or param[1]/value='1578'">Центральный филиал</xsl:when>
                    <xsl:when test="param[1]/value='1264' or param[1]/value='1579'">Тверской филиал</xsl:when>
                    <xsl:when test="param[1]/value='1265' or param[1]/value='1580'">Самарский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1266' or param[1]/value='1581'">Томский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1267' or param[1]/value='1582'">Тульский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1268' or param[1]/value='1583'">Тюменский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1269' or param[1]/value='1584'">Центральный филиал</xsl:when>
                    <xsl:when test="param[1]/value='1270' or param[1]/value='1585'">Бурятский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1271' or param[1]/value='1586'">Ульяновский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1272' or param[1]/value='1587'">Ухтинский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1273' or param[1]/value='1588'">Дальневосточный филиал</xsl:when>
                    <xsl:when test="param[1]/value='1274' or param[1]/value='1589'">Иркутский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1275' or param[1]/value='1590'">Уфимский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1276' or param[1]/value='1591'">Ухтинский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1277' or param[1]/value='1592'">Хабаровский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1278' or param[1]/value='1593'">Чайковский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1279' or param[1]/value='1594'">Нижегородский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1280' or param[1]/value='1595'">Челябинский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1281' or param[1]/value='1596'">Череповецкий филиал</xsl:when>
                    <xsl:when test="param[1]/value='1735' or param[1]/value='1740'">Западный филиал</xsl:when>
                    <xsl:when test="param[1]/value='1282' or param[1]/value='1597'">Томский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1733' or param[1]/value='1738'">Астраханский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1283' or param[1]/value='1598'">Югорский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1284' or param[1]/value='1599'">Южно-Сахалинский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1285' or param[1]/value='1600'">Томский филиал</xsl:when>
                    <xsl:when test="param[1]/value='1286' or param[1]/value='1601'">Ярославский филиал</xsl:when>
                    <xsl:when test="param[1]/value='270'">Смоленский филиал</xsl:when>
                    <!-- конец  вставки собранных в Excel строк -->
                    <xsl:otherwise>Не определено</xsl:otherwise>
                </xsl:choose>
            </value>
        </contract_site_corr>
        <sub_office_corr>
            <name>Sub-Office Id</name>
            <value>
                <xsl:choose>
                    <!-- замена подразделения по региону -->
                    <!-- начало вставки собранных в Excel строк -->
                    <xsl:when test="param[1]/value='280' or param[1]/value='1471'">179</xsl:when>
                    <xsl:when test="param[1]/value='281' or param[1]/value='1472'">165</xsl:when>
                    <xsl:when test="param[1]/value='1261' or param[1]/value='1576'">219</xsl:when>
                    <xsl:when test="param[1]/value='282' or param[1]/value='1473'">185</xsl:when>
                    <xsl:when test="param[1]/value='283' or param[1]/value='1474'">148</xsl:when>
                    <xsl:when test="param[1]/value='284' or param[1]/value='1475'">203</xsl:when>
                    <xsl:when test="param[1]/value='285' or param[1]/value='1476'">257</xsl:when>
                    <xsl:when test="param[1]/value='286' or param[1]/value='1477'">169</xsl:when>
                    <xsl:when test="param[1]/value='287' or param[1]/value='1478'">278</xsl:when>
                    <xsl:when test="param[1]/value='288' or param[1]/value='1479'">176</xsl:when>
                    <xsl:when test="param[1]/value='289' or param[1]/value='1480'">187</xsl:when>
                    <xsl:when test="param[1]/value='290' or param[1]/value='1481'">167</xsl:when>
                    <xsl:when test="param[1]/value='291' or param[1]/value='1482'">277</xsl:when>
                    <xsl:when test="param[1]/value='292' or param[1]/value='1483'">214</xsl:when>
                    <xsl:when test="param[1]/value='293' or param[1]/value='1484'">249</xsl:when>
                    <xsl:when test="param[1]/value='294' or param[1]/value='1485'">133</xsl:when>
                    <xsl:when test="param[1]/value='295' or param[1]/value='1486'">151</xsl:when>
                    <xsl:when test="param[1]/value='296' or param[1]/value='1487'">183</xsl:when>
                    <xsl:when test="param[1]/value='297' or param[1]/value='1488'">275</xsl:when>
                    <xsl:when test="param[1]/value='298' or param[1]/value='1489'">207</xsl:when>
                    <xsl:when test="param[1]/value='299' or param[1]/value='1490'">3482</xsl:when>
                    <xsl:when test="param[1]/value='300' or param[1]/value='1491'">208</xsl:when>
                    <xsl:when test="param[1]/value='301' or param[1]/value='1492'">149</xsl:when>
                    <xsl:when test="param[1]/value='302' or param[1]/value='1493'">145</xsl:when>
                    <xsl:when test="param[1]/value='303' or param[1]/value='1494'">280</xsl:when>
                    <xsl:when test="param[1]/value='304' or param[1]/value='1495'">261</xsl:when>
                    <xsl:when test="param[1]/value='305' or param[1]/value='1496'">136</xsl:when>
                    <xsl:when test="param[1]/value='306' or param[1]/value='1497'">259</xsl:when>
                    <xsl:when test="param[1]/value='307' or param[1]/value='1498'">234</xsl:when>
                    <xsl:when test="param[1]/value='308' or param[1]/value='1499'">265</xsl:when>
                    <xsl:when test="param[1]/value='309' or param[1]/value='1500'">245</xsl:when>
                    <xsl:when test="param[1]/value='310' or param[1]/value='1501'">215</xsl:when>
                    <xsl:when test="param[1]/value='311' or param[1]/value='1502'">178</xsl:when>
                    <xsl:when test="param[1]/value='312' or param[1]/value='1503'">4311</xsl:when>
                    <xsl:when test="param[1]/value='313' or param[1]/value='1504'">220</xsl:when>
                    <xsl:when test="param[1]/value='314' or param[1]/value='1505'">285</xsl:when>
                    <xsl:when test="param[1]/value='315' or param[1]/value='1506'">262</xsl:when>
                    <xsl:when test="param[1]/value='316' or param[1]/value='1507'">146</xsl:when>
                    <xsl:when test="param[1]/value='317' or param[1]/value='1508'">164</xsl:when>
                    <xsl:when test="param[1]/value='318' or param[1]/value='1509'">244</xsl:when>
                    <xsl:when test="param[1]/value='319' or param[1]/value='1510'">241</xsl:when>
                    <xsl:when test="param[1]/value='320' or param[1]/value='1511'">139</xsl:when>
                    <xsl:when test="param[1]/value='321' or param[1]/value='1512'">266</xsl:when>
                    <xsl:when test="param[1]/value='322' or param[1]/value='1513'">209</xsl:when>
                    <xsl:when test="param[1]/value='323' or param[1]/value='1514'">180</xsl:when>
                    <xsl:when test="param[1]/value='324' or param[1]/value='1515'">147</xsl:when>
                    <xsl:when test="param[1]/value='325' or param[1]/value='1516'">191</xsl:when>
                    <xsl:when test="param[1]/value='326' or param[1]/value='1517'">190</xsl:when>
                    <xsl:when test="param[1]/value='1734' or param[1]/value='1739'">138</xsl:when>
                    <xsl:when test="param[1]/value='327' or param[1]/value='1518'">283</xsl:when>
                    <xsl:when test="param[1]/value='328' or param[1]/value='1519'">204</xsl:when>
                    <xsl:when test="param[1]/value='329' or param[1]/value='1520'">177</xsl:when>
                    <xsl:when test="param[1]/value='330' or param[1]/value='1521'">260</xsl:when>
                    <xsl:when test="param[1]/value='331' or param[1]/value='1522'">218</xsl:when>
                    <xsl:when test="param[1]/value='332' or param[1]/value='1523'">273</xsl:when>
                    <xsl:when test="param[1]/value='333' or param[1]/value='1524'">267</xsl:when>
                    <xsl:when test="param[1]/value='334' or param[1]/value='1525'">279</xsl:when>
                    <xsl:when test="param[1]/value='1211' or param[1]/value='1526'">230</xsl:when>
                    <xsl:when test="param[1]/value='1212' or param[1]/value='1527'">264</xsl:when>
                    <xsl:when test="param[1]/value='1213' or param[1]/value='1528'">286</xsl:when>
                    <xsl:when test="param[1]/value='1214' or param[1]/value='1529'">226</xsl:when>
                    <xsl:when test="param[1]/value='1215' or param[1]/value='1530'">152</xsl:when>
                    <xsl:when test="param[1]/value='1216' or param[1]/value='1531'">222</xsl:when>
                    <xsl:when test="param[1]/value='1217' or param[1]/value='1532'">184</xsl:when>
                    <xsl:when test="param[1]/value='1218' or param[1]/value='1533'">239</xsl:when>
                    <xsl:when test="param[1]/value='1219' or param[1]/value='1534'">233</xsl:when>
                    <xsl:when test="param[1]/value='1220' or param[1]/value='1535'">223</xsl:when>
                    <xsl:when test="param[1]/value='1221' or param[1]/value='1536'">242</xsl:when>
                    <xsl:when test="param[1]/value='1222' or param[1]/value='1537'">217</xsl:when>
                    <xsl:when test="param[1]/value='1223' or param[1]/value='1538'">281</xsl:when>
                    <xsl:when test="param[1]/value='1224' or param[1]/value='1539'">181</xsl:when>
                    <xsl:when test="param[1]/value='1225' or param[1]/value='1540'">205</xsl:when>
                    <xsl:when test="param[1]/value='1226' or param[1]/value='1541'">175</xsl:when>
                    <xsl:when test="param[1]/value='1227' or param[1]/value='1542'">221</xsl:when>
                    <xsl:when test="param[1]/value='1228' or param[1]/value='1543'">224</xsl:when>
                    <xsl:when test="param[1]/value='1229' or param[1]/value='1544'">225</xsl:when>
                    <xsl:when test="param[1]/value='1731' or param[1]/value='1736'">232</xsl:when>
                    <xsl:when test="param[1]/value='1230' or param[1]/value='1545'">170</xsl:when>
                    <xsl:when test="param[1]/value='1231' or param[1]/value='1546'">268</xsl:when>
                    <xsl:when test="param[1]/value='1232' or param[1]/value='1547'">247</xsl:when>
                    <xsl:when test="param[1]/value='1233' or param[1]/value='1548'">248</xsl:when>
                    <xsl:when test="param[1]/value='1234' or param[1]/value='1549'">256</xsl:when>
                    <xsl:when test="param[1]/value='1235' or param[1]/value='1550'">250</xsl:when>
                    <xsl:when test="param[1]/value='1236' or param[1]/value='1551'">137</xsl:when>
                    <xsl:when test="param[1]/value='1237' or param[1]/value='1552'">134</xsl:when>
                    <xsl:when test="param[1]/value='1238' or param[1]/value='1553'">132</xsl:when>
                    <xsl:when test="param[1]/value='1239' or param[1]/value='1554'">213</xsl:when>
                    <xsl:when test="param[1]/value='1240' or param[1]/value='1555'">216</xsl:when>
                    <xsl:when test="param[1]/value='1241' or param[1]/value='1556'">210</xsl:when>
                    <xsl:when test="param[1]/value='1242' or param[1]/value='1557'">284</xsl:when>
                    <xsl:when test="param[1]/value='1243' or param[1]/value='1558'">269</xsl:when>
                    <xsl:when test="param[1]/value='1244' or param[1]/value='1559'">238</xsl:when>
                    <xsl:when test="param[1]/value='1245' or param[1]/value='1560'">252</xsl:when>
                    <xsl:when test="param[1]/value='1246' or param[1]/value='1561'">131</xsl:when>
                    <xsl:when test="param[1]/value='1732' or param[1]/value='1737'">240</xsl:when>
                    <xsl:when test="param[1]/value='1247' or param[1]/value='1562'">255</xsl:when>
                    <xsl:when test="param[1]/value='1248' or param[1]/value='1563'">246</xsl:when>
                    <xsl:when test="param[1]/value='1249' or param[1]/value='1564'">171</xsl:when>
                    <!-- <xsl:when test="param[1]/value='1250' or param[1]/value='1565'">270</xsl:when> -->
                    <xsl:when test="param[1]/value='1250'">270</xsl:when>
                    <xsl:when test="param[1]/value='1251' or param[1]/value='1566'">140</xsl:when>
                    <xsl:when test="param[1]/value='1252' or param[1]/value='1567'">251</xsl:when>
                    <xsl:when test="param[1]/value='1253' or param[1]/value='1568'">135</xsl:when>
                    <xsl:when test="param[1]/value='1254' or param[1]/value='1569'">206</xsl:when>
                    <xsl:when test="param[1]/value='1255' or param[1]/value='1570'">212</xsl:when>
                    <xsl:when test="param[1]/value='1256' or param[1]/value='1571'">237</xsl:when>
                    <xsl:when test="param[1]/value='1257' or param[1]/value='1572'">173</xsl:when>
                    <xsl:when test="param[1]/value='1258' or param[1]/value='1573'">227</xsl:when>
                    <xsl:when test="param[1]/value='1259' or param[1]/value='1574'">253</xsl:when>
                    <xsl:when test="param[1]/value='1260' or param[1]/value='1575'">144</xsl:when>
                    <xsl:when test="param[1]/value='1262' or param[1]/value='1577'">211</xsl:when>
                    <xsl:when test="param[1]/value='1263' or param[1]/value='1578'">274</xsl:when>
                    <xsl:when test="param[1]/value='1264' or param[1]/value='1579'">271</xsl:when>
                    <xsl:when test="param[1]/value='1265' or param[1]/value='1580'">254</xsl:when>
                    <xsl:when test="param[1]/value='1266' or param[1]/value='1581'">168</xsl:when>
                    <xsl:when test="param[1]/value='1267' or param[1]/value='1582'">276</xsl:when>
                    <xsl:when test="param[1]/value='1268' or param[1]/value='1583'">228</xsl:when>
                    <xsl:when test="param[1]/value='1269' or param[1]/value='1584'">272</xsl:when>
                    <xsl:when test="param[1]/value='1270' or param[1]/value='1585'">182</xsl:when>
                    <xsl:when test="param[1]/value='1271' or param[1]/value='1586'">263</xsl:when>
                    <xsl:when test="param[1]/value='1272' or param[1]/value='1587'">143</xsl:when>
                    <xsl:when test="param[1]/value='1273' or param[1]/value='1588'">186</xsl:when>
                    <xsl:when test="param[1]/value='1274' or param[1]/value='1589'">166</xsl:when>
                    <xsl:when test="param[1]/value='1275' or param[1]/value='1590'">236</xsl:when>
                    <xsl:when test="param[1]/value='1276' or param[1]/value='1591'">142</xsl:when>
                    <xsl:when test="param[1]/value='1277' or param[1]/value='1592'">188</xsl:when>
                    <xsl:when test="param[1]/value='1278' or param[1]/value='1593'">258</xsl:when>
                    <xsl:when test="param[1]/value='1279' or param[1]/value='1594'">243</xsl:when>
                    <xsl:when test="param[1]/value='1280' or param[1]/value='1595'">229</xsl:when>
                    <xsl:when test="param[1]/value='1281' or param[1]/value='1596'">150</xsl:when>
                    <xsl:when test="param[1]/value='1735' or param[1]/value='1740'">141</xsl:when>
                    <xsl:when test="param[1]/value='1282' or param[1]/value='1597'">172</xsl:when>
                    <xsl:when test="param[1]/value='1733' or param[1]/value='1738'">3500</xsl:when>
                    <xsl:when test="param[1]/value='1283' or param[1]/value='1598'">231</xsl:when>
                    <xsl:when test="param[1]/value='1284' or param[1]/value='1599'">189</xsl:when>
                    <xsl:when test="param[1]/value='1285' or param[1]/value='1600'">174</xsl:when>
                    <xsl:when test="param[1]/value='1286' or param[1]/value='1601'">282</xsl:when>
                    <!-- конец  вставки собранных в Excel строк -->
                    <xsl:otherwise>Не определено</xsl:otherwise>
                </xsl:choose>
            </value>
        </sub_office_corr>
    </xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="message" userelativepaths="yes" externalpreview="no" url="..\message.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml=""
		          commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->
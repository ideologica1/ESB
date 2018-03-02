<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Здесь определена трансформация подразделений -->
    <xsl:include href="departments.xsl"/>

    <xsl:variable name="crlf">
        <xsl:text>&#xD;&#xA;</xsl:text>
    </xsl:variable>
    <xsl:variable name="dq">
        <xsl:text>&quot;</xsl:text>
    </xsl:variable>
    <xsl:variable name="head1">Полис:</xsl:variable>
    <xsl:variable name="head2">Страхователь:</xsl:variable>
    <xsl:variable name="head10">Контактное лицо:</xsl:variable>
    <xsl:variable name="head11">ФИО:</xsl:variable>
    <xsl:variable name="head12">Телефон:</xsl:variable>
    <xsl:variable name="head13">Факс:</xsl:variable>
    <xsl:variable name="head14">email:</xsl:variable>
    <xsl:variable name="head15">Информация:</xsl:variable>
    <xsl:template match="/">
        <SiebelObjects>
            <!-- Параметры коннекта-->
            <Connect>siebel://s00-0000-sb11:2321/SOGAZ_PROD/FINSObjMgr_enu</Connect>
            <!--<Connect>siebel://s00-0000-sb13:2321/SOGAZ_PROD/FINSObjMgr_top</Connect> -->
            <!--<Connect>siebel://s00-0000-sb06:2321/SBA_81/FINSObjMgr_enu</Connect> -->
            <!--<Connect>siebel://s00-0000-sb22:2321/SBA_82/FINSObjMgr_enu</Connect> -->

            <Lang>ENU</Lang>
            <Login>SGZCOMPLEX</Login>
            <Password>SGZCOMPLEX</Password>


            <!-- Параметры коннекта -->
            <!--
            <Connect>siebel://s00-0000-sb11:2321/SOGAZ_PROD/FINSObjMgr_rus</Connect>
            <Lang>RUS</Lang>
            <Login>S_LAB</Login>
            <Password>123456q!</Password>
            -->

            <!-- Не работает(( Code error in module SiebelCRM: Method 'GetBusObject' of object 'ISiebelDataControl' failed-->

            <!-- Кол-во создаваемых бизнес-объектов -->
            <Count>
                <xsl:choose>
                    <!-- Связь с врачом-куратором - создавать SR не нужно -->
                    <xsl:when test="message/type/id='7'">0</xsl:when>
                    <!-- Иначе создаем объект в Siebel -->
                    <xsl:otherwise>1</xsl:otherwise>
                </xsl:choose>
            </Count>
            <!-- Описание каждого создаваемого бизнес-объекта -->
            <SiebelObject1>
                <BusObject>Service Request</BusObject>
                <!-- Создаваемые к объекту компоненты -->
                <BusComponents>
                    <Count>
                        <xsl:choose>
                            <xsl:when test="message/type/id='1'">2</xsl:when>
                            <!-- Уведомление о страховом случае -->
                            <xsl:otherwise>1</xsl:otherwise>
                        </xsl:choose>
                    </Count>
                    <!-- Описание каждого бизнес-компонента -->
                    <BusComp1>
                        <Name>Заявка</Name>
                        <BusCompName>Service Request</BusCompName>
                        <!-- Метод создания -->
                        <BusCompCreateMethod>NewBefore</BusCompCreateMethod>
                        <!-- Поля -->
                        <Fields>
                            <ins_product>
                                <name>INS Product</name>
                                <value>
                                    <xsl:choose>
                                        <xsl:when test="message/type/id='1'">Запрос по СС</xsl:when>
                                        <xsl:when test="message/type/id='2'">Заявка на страхование</xsl:when>
                                        <xsl:when test="message/type/id='3'">Отзыв</xsl:when>
                                        <xsl:when test="message/type/id='4'">Отзыв</xsl:when>
                                        <xsl:when test="message/type/id='5'">Отзыв</xsl:when>
                                        <xsl:when test="message/type/id='7'">Связаться с врачом-куратором</xsl:when>
                                        <xsl:when test="message/type/id='8'">Обратный вызов</xsl:when>
                                        <xsl:when test="message/type/id='9'">Информирование</xsl:when>
                                        <xsl:when test="message/type/id='10'">Андеррайтинг</xsl:when>
                                        <!-- Всё, что не описано - трансформируем в отзыв, иначе Siebel глючит -->
                                        <xsl:otherwise>Отзыв</xsl:otherwise>
                                    </xsl:choose>
                                </value>
                            </ins_product>
                            <ins_area>
                                <name>INS Area</name>
                                <value>
                                    <xsl:choose>
                                        <xsl:when test="message/type/id='3'">Жалоба</xsl:when>
                                        <xsl:when test="message/type/id='4'">Благодарность</xsl:when>
                                        <xsl:when test="message/type/id='5'">Предложение</xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="message/ins_line/name"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </value>
                            </ins_area>
                            <ins_sub-area>
                                <name>INS Sub-Area</name>
                                <!-- <name>SGZ INS Sub Area For UI</name> -->
                                <value>
                                    <xsl:choose>
                                        <xsl:when test="message/type/id='2'">
                                            <xsl:choose>
                                                <xsl:when test="message/ins_product/id='3499'">Ответственность
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='3483'">Сезон</xsl:when>
                                                <xsl:when test="message/ins_product/id='3458'">КАСКО для опытных
                                                    водителей
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='3459'">Минимум</xsl:when>
                                                <xsl:when test="message/ins_product/id='3456'">ОСАГО</xsl:when>
                                                <xsl:when test="message/ins_product/id='3479'">ДСАГО</xsl:when>
                                                <xsl:when test="message/ins_product/id='3457'">КАСКО</xsl:when>
                                                <xsl:when test="message/ins_product/id='3460'">Индивидуальный</xsl:when>
                                                <xsl:when test="message/ins_product/id='3469'">Ответственность
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='3463'">Имущество</xsl:when>
                                                <xsl:when test="message/ins_product/id='3462'">Загородный</xsl:when>
                                                <xsl:when test="message/ins_product/id='3461'">Эконом</xsl:when>
                                                <xsl:when test="message/ins_product/id='3464'">Универсальный</xsl:when>
                                                <xsl:when test="message/ins_product/id='3480'">Специальный</xsl:when>
                                                <xsl:when test="message/ins_product/id='3481'">Антиклещ</xsl:when>
                                                <xsl:when test="message/ins_product/id='3465'">Эконом</xsl:when>
                                                <xsl:when test="message/ins_product/id='3478'">Страхование гражданской
                                                    ответственности перед третьими лицами
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='3477'">Страхование земельных
                                                    участков
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='3476'">Страхование финансовых
                                                    рисков при инвестировании в строительство жилья
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='3475'">Страхование имущества на
                                                    случай утраты права собственности (титульное страхование)
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='3474'">Страхование имущества
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='3473'">Страхование от несчастных
                                                    случаев и болезней заемщика (созаемщика) кредита
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='3468'">Комплексное ипотечное
                                                    страхование
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='3467'">BUSINESS CARD</xsl:when>
                                                <xsl:when test="message/ins_product/id='3466'">Стандарт</xsl:when>
                                                <!-- Этот код приходить со "Сравни-Купи" -->
                                                <xsl:when test="message/ins_product/id='13165'">СОГАЗ-АВТО-Классика
                                                </xsl:when>
                                                <!-- Маппинг по "Новым" кодам страховых продуктов с sogaz.ru -->
                                                <xsl:when test="message/ins_product/id='113'">СОГАЗ-АВТО-Классика
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='112'">ДСАГО</xsl:when>
                                                <xsl:when test="message/ins_product/id='111'">ОСАГО</xsl:when>
                                                <xsl:when test="message/ins_product/id='121'">Простое решение</xsl:when>
                                                <xsl:when test="message/ins_product/id='125'">Дом индивидуальный
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='124'">Дом ответственность
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='123'">Дом имущество</xsl:when>
                                                <xsl:when test="message/ins_product/id='122'">Дом загородный</xsl:when>
                                                <xsl:when test="message/ins_product/id='121'">Дом эконом</xsl:when>
                                                <xsl:when test="message/ins_product/id='151'">Ипотека</xsl:when>
                                                <xsl:when test="message/ins_product/id='134'">Персона-Антиклещ
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='133'">Персона-Специальный
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='132'">Персона-Эконом</xsl:when>
                                                <xsl:when test="message/ins_product/id='131'">Персона-Универсальный
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="message/ins_product/name"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <!--##Agu: добавил для распознования подобласти запросов по СС со сканами документов -->
                                        <xsl:when test="message/type/id='1'">
                                            <xsl:choose>
                                                <xsl:when test="message/ins_product/id='4001'">Проверка документов
                                                    ОСАГО
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='4002'">МЧС</xsl:when>
                                                <xsl:when test="message/ins_product/id='4003'">КАСКО</xsl:when>
                                                <xsl:when test="message/ins_product/id='4004'">ОСАГО</xsl:when>
                                                <xsl:when test="message/ins_product/id='4005'">Несчастный случай
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='4006'">Потеря работы</xsl:when>
                                                <xsl:when test="message/ins_product/id='4007'">Минобороны</xsl:when>
                                                <xsl:when test="message/ins_product/id='4008'">Имущество</xsl:when>
                                                <xsl:when test="message/ins_product/id='4009'">Ответственность
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='4010'">Другое</xsl:when>
                                            </xsl:choose>
                                        </xsl:when>
                                        <!--##Agu: добавил для распознования подобласти запросов Информирование из ЛК -->
                                        <xsl:when test="message/type/id='9'">
                                            <xsl:choose>
                                                <xsl:when test="message/ins_product/id='4101'">Ручная идентификация
                                                </xsl:when>
                                                <xsl:when test="message/ins_product/id='4102'">Авто идентификация
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:when>
                                        <!--##Agu: добавил для распознования подобласти запросов Андеррайтинг из ПЛАТОН и ЛК -->
                                        <xsl:when test="message/type/id='10'">
                                            <xsl:choose>
                                                <xsl:when test="message/ins_product/id='4201'">ФЛ</xsl:when>
                                                <xsl:when test="message/ins_product/id='4202'">ИП</xsl:when>
                                                <xsl:when test="message/ins_product/id='4203'">ЮЛ</xsl:when>
                                            </xsl:choose>
                                        </xsl:when>
                                        <!--
                                        <xsl:when test="message/type/id='2' and contains(message/ins_product/name,'СОГАЗ')">
                                            <xsl:value-of select="substring-after(message/ins_product/name,' ')"/>
                                        </xsl:when>
                                        <xsl:when test="message/type/id='3'">-</xsl:when>
                                        <xsl:when test="message/type/id='4'">-</xsl:when>
                                        <xsl:when test="message/type/id='5'">-</xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="message/ins_product/name"/>
                                        </xsl:otherwise>
                                        -->
                                    </xsl:choose>
                                </value>
                            </ins_sub-area>
                            <applicant>
                                <name>Applicant</name>
                                <value>
                                    <xsl:value-of select="message/contact/fio"/>
                                </value>
                            </applicant>
                            <contact_phone>
                                <name>Phone Number</name>
                                <value>
                                    <xsl:value-of select="message/contact/phone"/>
                                </value>
                            </contact_phone>
                            <contact_fax>
                                <name>Name Info - Phone Number</name>
                                <value>
                                    <xsl:value-of select="message/contact/fax"/>
                                </value>
                            </contact_fax>
                            <email>
                                <name>Email</name>
                                <value>
                                    <xsl:value-of select="message/contact/email"/>
                                </value>
                            </email>
                            <Contact_Id>
                                <name>Contact Id</name>
                                <value>
                                    <xsl:value-of select="message/contact/Contact_Id"/>
                                </value>
                            </Contact_Id>
                            <LK_Consumer_GUID>
                                <name>LK Consumer GUID</name>
                                <value>
                                    <xsl:value-of select="message/lk/consumer_guid"/>
                                </value>
                            </LK_Consumer_GUID>
                            <LK_Id>
                                <name>LK Id</name>
                                <value>
                                    <xsl:value-of select="message/lk/id"/>
                                </value>
                            </LK_Id>
                            <ip_address>
                                <name>IP Address</name>
                                <value>
                                    <xsl:value-of select="message/contact/ip"/>
                                </value>
                            </ip_address>
                            <contact_guid>
                                <!-- Contact.Integration Id -->
                                <name>Contact GUID</name>
                                <value>
                                    <xsl:value-of select="message/contact/contact_guid"/>
                                </value>
                            </contact_guid>
                            <url_address>
                                <name>URL Address</name>
                                <value>
                                    <xsl:value-of select="message/res_url"/>
                                </value>
                            </url_address>
                            <ins_type>
                                <!-- Вид страхования -->
                                <name>Ins Type</name>
                                <value>
                                    <xsl:value-of select="message/ins_type"/>
                                </value>
                            </ins_type>
                            <web_request_number>
                                <name>Web Request Number</name>
                                <value>
                                    <xsl:value-of select="message/type/number"/>
                                </value>
                            </web_request_number>
                            <request_date>
                                <name>Request Date</name>
                                <value>
                                    <!-- Для пустой даты - вставляем пустое, иначе из DD.MM.YYYY HH:NN делаем MM/DD/YYYY HH:NN:SS-->
                                    <xsl:choose>
                                        <xsl:when test="message/contact/datetime!=''">
                                            <xsl:value-of
                                                    select="concat(substring(message/contact/datetime,4,2),'/',substring(message/contact/datetime,1,2),'/',substring(message/contact/datetime,7,4),' ',substring(message/contact/datetime,12,5),':00')"/>
                                        </xsl:when>
                                        <xsl:otherwise></xsl:otherwise>
                                    </xsl:choose>
                                </value>
                            </request_date>
                            <birthdate>
                                <name>Birthdate</name>
                                <value>
                                    <!-- Для пустой даты - вставляем пустое, иначе из DD.MM.YYYY делаем MM/DD/YYYY-->
                                    <xsl:choose>
                                        <xsl:when test="message/contact/birthdate!=''">
                                            <xsl:value-of
                                                    select="concat(substring(message/contact/birthdate,4,2),'/',substring(message/contact/birthdate,1,2),'/',substring(message/contact/birthdate,7,4))"/>
                                        </xsl:when>
                                        <xsl:otherwise></xsl:otherwise>
                                    </xsl:choose>
                                </value>
                            </birthdate>
                            <abstract>
                                <name>Abstract</name>
                                <value>
                                    <!--
                                    <xsl:value-of select="concat($head10,$crlf,$head11,message/contact/fio,$crlf,$head12,message/contact/phone,$crlf,$head13,message/contact/fax,$crlf,$head14,message/contact/email,$crlf,$head15,message/extra_info)"/>
                                -->
                                    <xsl:choose>
                                        <xsl:when test="message/type/id='2'">Параметры калькуляции см. на закладке
                                            ВЛОЖЕНИЯ (файл message_h.htm). Там же - приложенные к заявке документы.
                                        </xsl:when>
                                        <xsl:when test="message/type/id='1'">В случае страхового события по ВПМЖ
                                            параметры полиса см. на закладке ВЛОЖЕНИЯ (файл message_h.htm).
                                        </xsl:when>
                                        <xsl:otherwise>См.поле КОММЕНТАРИЙ на закладке ДОП.ИНФО</xsl:otherwise>
                                        <!--
                                        <xsl:otherwise>
                                            <xsl:value-of select="message/ins_product/name"/>
                                        </xsl:otherwise>
-->
                                    </xsl:choose>
                                </value>
                            </abstract>
                            <description>
                                <name>Description</name>
                                <value>
                                    <!--
                                    <xsl:value-of select="concat($head1,message/policy/number,$crlf,$head2,message/policy/holder)"/>
                                -->
                                    <xsl:value-of select="message/extra_info"/>
                                </value>
                            </description>
                            <SGZProject>
                                <name>SGZ Project</name>
                                <value>
                                    <xsl:value-of select="message/SGZProject"/>
                                </value>
                            </SGZProject>
                            <insurer>
                                <name>Insurer</name>
                                <value>
                                    <xsl:value-of select="message/policy/holder"/>
                                </value>
                            </insurer>
                            <contract_policy>
                                <name>Contract Policy</name>
                                <value>
                                    <xsl:value-of select="message/policy/number"/>
                                </value>
                            </contract_policy>
                            <contact_number_new>
                                <!-- Номер заключенного договора -->
                                <name>Contact Number New</name>
                                <value>
                                    <xsl:value-of select="message/policy/contact_number_new"/>
                                </value>
                            </contact_number_new>
                            <revenue>
                                <name>Revenue</name>
                                <value>
                                    <xsl:value-of select="message/policy/revenue"/>
                                </value>
                            </revenue>
                            <source>
                                <name>Source</name>
                                <!-- Для пустого значения - вставляем Web, иначе - само значение -->
                                <value>
                                    <xsl:choose>
                                        <xsl:when test="message/type/source!=''">
                                            <xsl:value-of select="message/type/source"/>
                                        </xsl:when>
                                        <xsl:otherwise>Web</xsl:otherwise>
                                    </xsl:choose>
                                </value>

                                <!--<value>Web</value> -->
                            </source>
                            <SGZ_Complaint_Type>
                                <name>SGZ Complaint Type</name>
                                <value>
                                    <xsl:choose>
                                        <xsl:when test="message/type/id='3' and message/type/name='Жалоба'">Новая
                                            жалоба
                                        </xsl:when>
                                        <!-- <xsl:otherwise>Новая жалоба</xsl:otherwise> -->
                                    </xsl:choose>
                                </value>
                            </SGZ_Complaint_Type>
                            <SGZ_Sub_Complaint_Type>
                                <name>SGZ Sub Complaint Type</name>
                                <value>
                                    <xsl:choose>
                                        <xsl:when test="message/type/id='3' and message/type/name='Жалоба'">Начало
                                            работы
                                        </xsl:when>
                                        <!-- <xsl:otherwise>Новая жалоба</xsl:otherwise> -->
                                    </xsl:choose>
                                </value>
                            </SGZ_Sub_Complaint_Type>
                            <SGZ_Agreement_DRP_Flag>
                                <name>SGZ Agreement DRP Flag</name>
                                <value>
                                    <xsl:choose>
                                        <xsl:when test="message/type/id='3' and message/type/name='Жалоба'">N</xsl:when>
                                        <!-- <xsl:otherwise>Новая жалоба</xsl:otherwise> -->
                                    </xsl:choose>
                                </value>
                            </SGZ_Agreement_DRP_Flag>
                            <contract_site>
                                <name>Contract Site</name>
                                <!-- Стандартный вариант <value> -->
                                <!--
                                <value>
                                    <xsl:call-template name="siebel_dep_name">
                                        <xsl:with-param name="web_dep_name" select="message/branch/name_branch"/>
                                    </xsl:call-template>
                                </value>
                                -->
                                <!-- Альтернативный вариант <value> для переадресации заявок на страхование по ОСАГО в ЕКЦ -->

                                <value>
                                    <xsl:choose>
                                        <xsl:when
                                                test="message/type/id='2' and message/type/source !='Телеком-экспресс' and message/type/source !='Танго-Телеком'">
                                            Головной офис
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:call-template name="siebel_dep_name">
                                                <xsl:with-param name="web_dep_name"
                                                                select="message/branch/name_branch"/>
                                            </xsl:call-template>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </value>


                            </contract_site>
                            <sub_office>
                                <name>Sub-Office Id</name>
                                <!-- Стандартный вариант <value> -->
                                <!--
                                <value>
                                    <xsl:call-template name="dep_reroute">
                                        <xsl:with-param name="dep_id" select="message/branch/id_dep"/>
                                    </xsl:call-template>
                                </value>
                                -->
                                <!-- Альтернативный вариант <value> для переадресации заявок на страхование по ОСАГО в ЕКЦ -->

                                <value>
                                    <xsl:choose>
                                        <xsl:when
                                                test="message/type/id='2' or (message/type/source !='Телеком-Экспресс' and message/type/source !='Танго-Телеком' and message/type/source !='ЛК')">
                                            999
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:call-template name="dep_reroute">
                                                <xsl:with-param name="dep_id" select="message/branch/id_dep"/>
                                            </xsl:call-template>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </value>


                            </sub_office>
                            <!--
пробуем переписать значения филиала и подразделения
в случае заявки по КАСКО и наличия калькуляции по ней 
в зависимости от указанного в калькуляции региона 
-->
                            <!-- закомментировано, т.к. заявка может уехать в тот регион, где нет обслуги на нее
                            <xsl:choose>
                                <xsl:when test="message/ins_product/id='3457' or message/ins_product/id='3458'">
                                    <xsl:call-template name="kasko_region_corr"/>
                                </xsl:when>
                            </xsl:choose>
-->
                        </Fields>
                        <!-- Вызов метода (если надо) -->
                        <InvokeMethods>
                            <!-- Момент вызова - до записи компонента -->
                            <BeforeWrite>
                            </BeforeWrite>
                            <!-- Момент вызова - после записи компонента -->
                            <AfterWrite>
                                <Count>3</Count>
                                <Method1>
                                    <MethodName>Authorize</MethodName>
                                    <!-- Аргументы (если есть) -->
                                    <ArgsCount>0</ArgsCount>
                                    <!--<Args1>aaa</Args1>
                                    <Args2>bbb</Args2>
                                    <Args3>ccc</Args3>-->
                                </Method1>
                                <Method2>
                                    <MethodName>SGZContactSearch</MethodName>
                                    <!-- Аргументы (если есть) -->
                                    <ArgsCount>0</ArgsCount>
                                    <!--<Args1>aaa</Args1>
                                    <Args2>bbb</Args2>
                                    <Args3>ccc</Args3>-->
                                </Method2>
                                <Method3>
                                    <MethodName>SGZAssign</MethodName>
                                    <!-- Аргументы (если есть) -->
                                    <ArgsCount>0</ArgsCount>
                                    <!--<Args1>aaa</Args1>
                                    <Args2>bbb</Args2>
                                    <Args3>ccc</Args3>-->
                                </Method3>
                            </AfterWrite>
                        </InvokeMethods>
                        <Result>
                            <!-- Id созданного компонента -->
                            <BusComp_id>Id</BusComp_id>
                            <!-- Во всех ссылках макрос {BusCompХ_Id} заменяется на id соотв. компонента -->
                            <BusComp_url>http://s00-0000-sb14/fins_rus/start.swe?SWECmd=GotoView&amp;SWEView=Service+Request+Detail+View&amp;SWERF=1&amp;SWEHo=s00-0000-sb14&amp;SWEBU=1&amp;SWEApplet0=Service+Request+Detail+Applet&amp;SWERowId0={BusComp1_Id}</BusComp_url>
                            <!-- Номер для отображения (если есть) -->
                            <BusComp_number>SR Number</BusComp_number>
                        </Result>
                    </BusComp1>
                    <!-- Создание этого компонента должно быть условным и зависеть от типа сообщения -->
                    <xsl:choose>
                        <xsl:when test="message/type/id='1'">
                            <!-- Уведомление о страховом случае -->
                            <BusComp2>
                                <Name>Страховое событие</Name>
                                <BusCompName>FINS Claims Event</BusCompName>
                                <!-- Метод создания -->
                                <BusCompCreateMethod>NewBefore</BusCompCreateMethod>
                                <!-- Поля -->
                                <Fields>
                                    <event_start_date>
                                        <name>Event Start Date</name>
                                        <value>
                                            <!-- Для пустой даты - вставляем пустое, иначе из DD.MM.YYYY HH:NN делаем MM/DD/YYYY HH:NN:SS-->
                                            <xsl:choose>
                                                <xsl:when test="message/accident/datetime!=''">
                                                    <xsl:value-of
                                                            select="concat(substring(message/accident/datetime,4,2),'/',substring(message/accident/datetime,1,2),'/',substring(message/accident/datetime,7,4),' ',substring(message/accident/datetime,12,5),':00')"/>
                                                </xsl:when>
                                                <xsl:otherwise></xsl:otherwise>
                                            </xsl:choose>
                                        </value>
                                    </event_start_date>
                                    <accident_address>
                                        <name>Address</name>
                                        <value>
                                            <xsl:value-of select="message/accident/place"/>
                                        </value>
                                    </accident_address>
                                    <victim>
                                        <name>Victim</name>
                                        <value>
                                            <xsl:value-of select="message/accident/victim"/>
                                        </value>
                                    </victim>
                                    <description>
                                        <name>Description</name>
                                        <value>
                                            <xsl:value-of select="message/accident/accident_description"/>.
                                        </value>
                                    </description>
                                    <damage_description>
                                        <name>Damage Description</name>
                                        <value>
                                            <xsl:value-of select="message/accident/victim_loss_description"/>
                                        </value>
                                    </damage_description>
                                    <third_party_damage_description>
                                        <name>Thrid Party Damage Description</name>
                                        <value>
                                            <xsl:value-of select="message/accident/third_party_loss_description"/>
                                        </value>
                                    </third_party_damage_description>
                                    <claim_amount>
                                        <name>Claim Amount</name>
                                        <value>
                                            <xsl:value-of select="message/accident/loss_amount"/>
                                        </value>
                                    </claim_amount>
                                    <paid_for>
                                        <name>Paid For</name>
                                        <value>
                                            <xsl:value-of select="message/accident/paid"/>
                                        </value>
                                    </paid_for>
                                    <IC_interaction>
                                        <name>IC Interaction</name>
                                        <value>
                                            <xsl:value-of select="message/accident/assist_called"/>
                                        </value>
                                    </IC_interaction>
                                </Fields>
                                <Result>
                                    <!--<BusComp_id>Id</BusComp_id>-->
                                    <!--<BusComp_url>http://s00-0000-sb04/fins_rus/start.swe?SWECmd=GotoView&amp;SWEView=SGZ+Service+Request+Claim+Events&amp;SWERF=1&amp;SWEHo=s00-0000-sb04&amp;SWEBU=1&amp;SWEApplet0=Service+Request+Detail+Applet&amp;SWERowId0={BusComp1_Id}&amp;SWEApplet1=FINS+Claims+Event+Detail+Form+Applet&amp;SWERowId1={BusComp2_Id}</BusComp_url>-->
                                    <!-- У этого компонента нет номера <BusComp_number>SR Number</BusComp_number> -->
                                </Result>
                            </BusComp2>
                        </xsl:when>
                    </xsl:choose>
                    <AttBusComp>
                        <Name>Вложение</Name>
                        <BusCompName>Service Request Attachment</BusCompName>
                        <AttMethod>CreateFile</AttMethod>
                        <!--<AttArgs0>\\s00-0000-dm05\SiebelAtt\</AttArgs0> -->
                        <AttArgs0>\\s00-0000-fc02\SiebelAtt\</AttArgs0>
                        <AttArgs1>ActivityFileName</AttArgs1>
                        <AttArgs2>Y</AttArgs2>
                    </AttBusComp>
                </BusComponents>
            </SiebelObject1>
        </SiebelObjects>
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
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="message.xml" srcSchemaRoot="message" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/"></template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->
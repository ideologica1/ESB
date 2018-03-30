<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <ImportSR_Input>
            <wstxns1:ListOfSgzServiceRequestWebsite
                    xmlns:wstxns1="http://www.siebel.com/xml/SGZ%20Service%20Request%20Website">
                <ServiceRequest>
                    <ServiceRequest>
                        <ins_product>
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
                        </ins_product>
                        <ins_area>
                            <xsl:choose>
                                <xsl:when test="message/type/id='3'">Жалоба</xsl:when>
                                <xsl:when test="message/type/id='4'">Благодарность</xsl:when>
                                <xsl:when test="message/type/id='5'">Предложение</xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="message/ins_line/name"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </ins_area>
                        <ins_sub-area>
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
                            </xsl:choose>
                        </ins_sub-area>
                        <applicant>
                            <xsl:value-of select="message/contact/fio"/>
                        </applicant>
                        <contact_phone>
                            <xsl:value-of select="message/contact/phone"/>
                        </contact_phone>
                        <contact_fax>
                            <xsl:value-of select="message/contact/fax"/>
                        </contact_fax>
                        <email>
                            <xsl:value-of select="message/contact/email"/>
                        </email>
                        <Contact_Id>
                            <xsl:value-of select="message/contact/Contact_Id"/>
                        </Contact_Id>
                        <LK_Consumer_GUID>
                            <xsl:value-of select="message/lk/consumer_guid"/>
                        </LK_Consumer_GUID>
                        <LK_Id>
                            <xsl:value-of select="message/lk/id"/>
                        </LK_Id>
                        <ip_address>
                            <xsl:value-of select="message/contact/ip"/>
                        </ip_address>
                        <contact_guid>
                            <xsl:value-of select="message/contact/contact_guid"/>
                        </contact_guid>
                        <url_address>
                            <xsl:value-of select="message/res_url"/>
                        </url_address>
                        <ins_type>
                            <xsl:value-of select="message/ins_type"/>
                        </ins_type>
                        <web_request_number>
                            <xsl:value-of select="message/type/number"/>
                        </web_request_number>
                        <request_date>
                            <xsl:choose>
                                <xsl:when test="message/contact/datetime!=''">
                                    <xsl:value-of
                                            select="concat(substring(message/contact/datetime,4,2),'/',substring(message/contact/datetime,1,2),'/',substring(message/contact/datetime,7,4),' ',substring(message/contact/datetime,12,5),':00')"/>
                                </xsl:when>
                                <xsl:otherwise>

                                </xsl:otherwise>
                            </xsl:choose>
                        </request_date>
                        <birthdate>
                            <xsl:choose>
                                <xsl:when test="message/contact/birthdate!=''">
                                    <xsl:value-of
                                            select="concat(substring(message/contact/birthdate,4,2),'/',substring(message/contact/birthdate,1,2),'/',substring(message/contact/birthdate,7,4))"/>
                                </xsl:when>
                                <xsl:otherwise></xsl:otherwise>
                            </xsl:choose>
                        </birthdate>
                        <abstract>
                            <xsl:choose>
                                <xsl:when test="message/type/id='2'">Параметры калькуляции см. на закладке
                                    ВЛОЖЕНИЯ (файл message_h.htm). Там же - приложенные к заявке документы.
                                </xsl:when>
                                <xsl:when test="message/type/id='1'">В случае страхового события по ВПМЖ
                                    параметры полиса см. на закладке ВЛОЖЕНИЯ (файл message_h.htm).
                                </xsl:when>
                                <xsl:otherwise>См.поле КОММЕНТАРИЙ на закладке ДОП.ИНФО</xsl:otherwise>
                            </xsl:choose>
                        </abstract>
                        <description>
                            <xsl:value-of select="message/extra_info"/>
                        </description>
                        <SGZProject>
                            <xsl:value-of select="message/SGZProject"/>
                        </SGZProject>
                        <insurer>
                            <xsl:value-of select="message/policy/holder"/>
                        </insurer>
                        <contract_policy>
                            <xsl:value-of select="message/policy/number"/>
                        </contract_policy>
                        <contact_number_new>
                            <xsl:value-of select="message/policy/contact_number_new"/>
                        </contact_number_new>
                        <revenue>
                            <xsl:value-of select="message/policy/revenue"/>
                        </revenue>
                        <source>
                            <xsl:choose>
                                <xsl:when test="message/type/source!=''">
                                    <xsl:value-of select="message/type/source"/>
                                </xsl:when>
                                <xsl:otherwise>Web</xsl:otherwise>
                            </xsl:choose>
                        </source>
                        <SGZ_Complaint_Type>
                            <xsl:choose>
                                <xsl:when test="message/type/id='3' and message/type/name='Жалоба'">Новая
                                    жалоба
                                </xsl:when>
                                <!-- <xsl:otherwise>Новая жалоба</xsl:otherwise> -->
                            </xsl:choose>
                        </SGZ_Complaint_Type>
                        <SGZ_Sub_Complaint_Type>
                            <xsl:choose>
                                <xsl:when test="message/type/id='3' and message/type/name='Жалоба'">Начало
                                    работы
                                </xsl:when>
                                <!-- <xsl:otherwise>Новая жалоба</xsl:otherwise> -->
                            </xsl:choose>
                        </SGZ_Sub_Complaint_Type>
                        <SGZ_Agreement_DRP_Flag>
                            <xsl:choose>
                                <xsl:when test="message/type/id='3' and message/type/name='Жалоба'">N</xsl:when>
                                <!-- <xsl:otherwise>Новая жалоба</xsl:otherwise> -->
                            </xsl:choose>
                        </SGZ_Agreement_DRP_Flag>
                        <contract_site>
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
                        </contract_site>
                        <sub_office>
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
                        </sub_office>
                    </ServiceRequest>
                </ServiceRequest>
            </wstxns1:ListOfSgzServiceRequestWebsite>
        </ImportSR_Input>
    </xsl:template>
    <xsl:template name="dep_reroute">
        <xsl:param name="dep_id"></xsl:param>
        <xsl:choose>
            <xsl:when test="$dep_id='181'">180</xsl:when> <!-- Новокузнецк -> Кемерово -->
            <xsl:otherwise>
                <xsl:value-of select="$dep_id"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
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
</xsl:stylesheet>

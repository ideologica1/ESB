<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <email_message>
            <xsl:choose>
                <!-- Уведомление о страховом случае -->
                <xsl:when test="message/type/id='1'">
                    <xsl:choose>
                        <xsl:when test="message/ins_line/name='АВТО'">
                            <to>Kutepova.Galina@sogaz.ru</to>
                        </xsl:when>
                        <xsl:when test="message/ins_line/name='ПЕРСОНА'">
                            <to>Niyazlieva.Dzhahan@sogaz.ru</to>
                        </xsl:when>
                        <xsl:when test="message/ins_line/name='ВОЯЖ'">
                            <to>Sherban.Svetlana@sogaz.ru</to>
                        </xsl:when>
                        <xsl:otherwise>
                            <to>TryakinAA@sogaz.ru</to>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!--<cc></cc>-->
                    <bcc>TryakinAA@sogaz.ru</bcc>
                    <subject>Уведомление о страховом случае с сайта СОГАЗ-КОМПЛЕКС</subject>
                    <!-- Шаблон {Message_Text} заменяется на содержимое сообщения -->
                    <message_body>{Message_Text}</message_body>
                </xsl:when>
                <!-- Заявка на страхование -->
                <xsl:when test="message/type/id='2'">
                    <to></to> <!-- 06.12.2016 Убрал Трякина по заявке от Зятева WO-1413366-->
                    <!--<cc></cc>-->
                    <bcc>Chulikov.Denis@sogaz.ru
                        <xsl:if test="message/branch/id_branch='264'">; Shilkov.Denis@sogaz.ru</xsl:if>
                    </bcc>
                    <subject>Заявка на страхование с сайта СОГАЗ-КОМПЛЕКС</subject>
                    <!-- Шаблон {Message_Text} заменяется на содержимое сообщения -->
                    <message_body>{Message_Text}</message_body>
                </xsl:when>
                <!-- Жалоба -->
                <xsl:when test="message/type/id='3'">
                    <to>TryakinAA@sogaz.ru</to>
                    <!--<cc></cc>-->
                    <bcc>Chulikov.Denis@sogaz.ru
                        <xsl:if test="message/branch/id_branch='264'">; Shilkov.Denis@sogaz.ru</xsl:if>
                    </bcc>
                    <subject>Жалоба с сайта СОГАЗ-КОМПЛЕКС</subject>
                    <!-- Шаблон {Message_Text} заменяется на содержимое сообщения -->
                    <message_body>{Message_Text}</message_body>
                </xsl:when>
                <!-- Благодарность -->
                <xsl:when test="message/type/id='4'">
                    <to>TryakinAA@sogaz.ru</to>
                    <!--<cc></cc>-->
                    <bcc>Chulikov.Denis@sogaz.ru
                        <xsl:if test="message/branch/id_branch='264'">; Shilkov.Denis@sogaz.ru</xsl:if>
                    </bcc>
                    <subject>Благодарность с сайта СОГАЗ-КОМПЛЕКС</subject>
                    <!-- Шаблон {Message_Text} заменяется на содержимое сообщения -->
                    <message_body>{Message_Text}</message_body>
                </xsl:when>
                <!-- Предложение -->
                <xsl:when test="message/type/id='5'">
                    <to>TryakinAA@sogaz.ru</to>
                    <!--<cc></cc>-->
                    <bcc>Chulikov.Denis@sogaz.ru
                        <xsl:if test="message/branch/id_branch='264'">; Shilkov.Denis@sogaz.ru</xsl:if>
                    </bcc>
                    <subject>Предложение с сайта СОГАЗ-КОМПЛЕКС</subject>
                    <!-- Шаблон {Message_Text} заменяется на содержимое сообщения -->
                    <message_body>{Message_Text}</message_body>
                </xsl:when>
                <!-- Связь с врачом-куратором -->
                <xsl:when test="message/type/id='7'">
                    <to>Savchenko.Nikolay@sogaz.ru; dms_go@sogaz.ru</to>
                    <!--<cc></cc>-->
                    <bcc>agu@sogaz.ru</bcc>
                    <subject>Связь с врачом-куратором с сайта СОГАЗ-КОМПЛЕКС</subject>
                    <!-- Шаблон {Message_Text} заменяется на содержимое сообщения -->
                    <message_body>{Message_Text}</message_body>
                </xsl:when>
                <!-- Обратный вызов -->
                <xsl:when test="message/type/id='8'">
                    <to>TryakinAA@sogaz.ru</to>
                    <!--<cc></cc>-->
                    <bcc>Chulikov.Denis@sogaz.ru
                        <xsl:if test="message/branch/id_branch='264'">; Shilkov.Denis@sogaz.ru</xsl:if>
                    </bcc>
                    <subject>Обратный вызов с сайта СОГАЗ-КОМПЛЕКС</subject>
                    <!-- Шаблон {Message_Text} заменяется на содержимое сообщения -->
                    <message_body>{Message_Text}</message_body>
                </xsl:when>
                <xsl:otherwise>
                    <to>TryakinAA@sogaz.ru</to>
                    <!--<cc></cc>-->
                    <bcc>Chulikov.Denis@sogaz.ru</bcc>
                    <subject>Сообщение неизвестного типа с сайта СОГАЗ-КОМПЛЕКС</subject>
                    <!-- Шаблон {Message_Text} заменяется на содержимое сообщения -->
                    <message_body>{Message_Text}</message_body>
                </xsl:otherwise>
            </xsl:choose>
        </email_message>
    </xsl:template>
</xsl:stylesheet>

        <!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.
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
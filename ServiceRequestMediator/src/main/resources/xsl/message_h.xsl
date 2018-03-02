<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <style>
                body,table {
                background: #ffd7af;
                font-family: Verdana, Arial, Helvetica, sans-serif;
                font-size: 11px;
                }
                table {
                background: #2e5283;
                width: 500;
                }
                tr {
                background:#dae1e9;
                }
                th {
                background: #2e5283;
                color:#FFFFFF;
                }
            </style>
            <h5>Информационное сообщение с сайта &quot;СОГАЗ-Комплекс&quot;</h5>
            <table>
                <tr>
                    <th>Наименование</th>
                    <th>Код</th>
                    <th>Значение</th>
                </tr>
                <xsl:apply-templates select="message/type"/>
                <xsl:apply-templates select="message/ins_line"/>
                <xsl:apply-templates select="message/ins_product"/>
                <xsl:apply-templates select="message/calculation"/>
                <xsl:apply-templates select="message/policy"/>
                <xsl:apply-templates select="message/accident"/>
                <xsl:apply-templates select="message/extra_info"/>
                <xsl:apply-templates select="message/branch"/>
                <xsl:apply-templates select="message/contact"/>
            </table>
        </html>
    </xsl:template>

    <xsl:template match="type">
        <tr>
            <td>Тип сообщения:</td>
            <td>
                <xsl:value-of select="id"/>
            </td>
            <td>
                <xsl:value-of select="name"/>
            </td>
        </tr>
        <tr>
            <td>Номер сообщения:</td>
            <td>
                <xsl:value-of select="id"/>
            </td>
            <td>
                <xsl:value-of select="number"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="ins_line">
        <tr>
            <td>Вид страхования:</td>
            <td>
                <xsl:value-of select="id"/>
            </td>
            <td>
                <xsl:value-of select="name"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="ins_product">
        <tr>
            <td>Страховой продукт:</td>
            <td>
                <xsl:value-of select="id"/>
            </td>
            <td>
                <xsl:value-of select="name"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="contact">
        <tr>
            <th colspan="3">Контактное лицо</th>
        </tr>
        <tr>
            <td>ФИО:</td>
            <td></td>
            <td>
                <xsl:value-of select="fio"/>
            </td>
        </tr>
        <tr>
            <td>Телефон:</td>
            <td></td>
            <td>
                <xsl:value-of select="phone"/>
            </td>
        </tr>
        <tr>
            <td>Факс:</td>
            <td></td>
            <td>
                <xsl:value-of select="fax"/>
            </td>
        </tr>
        <tr>
            <td>email:</td>
            <td></td>
            <td>
                <xsl:value-of select="email"/>
            </td>
        </tr>
        <tr>
            <td>С какого IP пришел запрос:</td>
            <td></td>
            <td>
                <xsl:value-of select="ip"/>
            </td>
        </tr>
        <tr>
            <td>Дата и время запроса:</td>
            <td></td>
            <td>
                <xsl:value-of select="datetime"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="branch">
        <tr>
            <th colspan="3">Офис СОГАЗа</th>
        </tr>
        <tr>
            <td>Федеральный округ:</td>
            <td>
                <xsl:value-of select="id_state"/>
            </td>
            <td>
                <xsl:value-of select="name_state"/>
            </td>
        </tr>
        <tr>
            <td>Филиал:</td>
            <td>
                <xsl:value-of select="id_branch"/>
            </td>
            <td>
                <xsl:value-of select="name_branch"/>
            </td>
        </tr>
        <tr>
            <td>Офис:</td>
            <td>
                <xsl:value-of select="id_dep"/>
            </td>
            <td>
                <xsl:value-of select="name_dep"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="policy">
        <tr>
            <th colspan="3">Информация о договоре/полисе</th>
        </tr>
        <tr>
            <td>Номер:</td>
            <td></td>
            <td>
                <xsl:value-of select="number"/>
            </td>
        </tr>
        <tr>
            <td>Страхователь:</td>
            <td></td>
            <td>
                <xsl:value-of select="holder"/>
            </td>
        </tr>
        <xsl:apply-templates select="voyage"/>
    </xsl:template>

    <xsl:template match="accident">
        <tr>
            <th colspan="3">Информация о страховом событии</th>
        </tr>
        <tr>
            <td>Дата и время события:</td>
            <td></td>
            <td>
                <xsl:value-of select="datetime"/>
            </td>
        </tr>
        <tr>
            <td>Место события:</td>
            <td></td>
            <td>
                <xsl:value-of select="place"/>
            </td>
        </tr>
        <tr>
            <td>Пострадавший застрахованный (человек или ТС):</td>
            <td></td>
            <td>
                <xsl:value-of select="victim"/>
            </td>
        </tr>
        <tr>
            <td>Описание события:</td>
            <td></td>
            <td>
                <xsl:value-of select="accident_description"/>
            </td>
        </tr>
        <tr>
            <td>Ущерб, нанесенный пострадавшему застрахованному:</td>
            <td></td>
            <td>
                <xsl:value-of select="victim_loss_description"/>
            </td>
        </tr>
        <tr>
            <td>Ущерб, нанесенный третьим лицам:</td>
            <td></td>
            <td>
                <xsl:value-of select="third_party_loss_description"/>
            </td>
        </tr>
        <tr>
            <td>Ориентировочный размер ущерба (руб.):</td>
            <td></td>
            <td>
                <xsl:value-of select="loss_amount"/>
            </td>
        </tr>
        <xsl:apply-templates select="paid"/>
        <xsl:apply-templates select="assist_called"/>
    </xsl:template>

    <xsl:template match="voyage">
        <tr>
            <td>Действует с:</td>
            <td></td>
            <td>
                <xsl:value-of select="valid_from"/>
            </td>
        </tr>
        <tr>
            <td>Действует по:</td>
            <td></td>
            <td>
                <xsl:value-of select="valid_till"/>
            </td>
        </tr>
        <tr>
            <td>Страховая сумма:</td>
            <td></td>
            <td><xsl:value-of select="sum_ins"/>.<xsl:value-of select="cur_ins"/>
            </td>
        </tr>
        <tr>
            <td>Стоматология:</td>
            <td></td>
            <td><xsl:value-of select="sum_dental"/>.<xsl:value-of select="cur_dental"/>
            </td>
        </tr>
        <tr>
            <td>Программа:</td>
            <td></td>
            <td>
                <xsl:value-of select="program"/>
            </td>
        </tr>
        <tr>
            <td>Особые условия:</td>
            <td></td>
            <td>
                <xsl:value-of select="special_terms"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="extra_info">
        <tr>
            <td>Дополнительная информация:</td>
            <td></td>
            <td>
                <xsl:value-of select="text()"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="calculation">
        <xsl:apply-templates select="form"/>
        <xsl:apply-templates select="koeffs"/>
        <xsl:apply-templates select="sum"/>
    </xsl:template>

    <xsl:template match="form">
        <tr>
            <td>
                <b>Параметры калькуляции страхового продукта</b>
            </td>
            <td></td>
            <td></td>
        </tr>
        <xsl:apply-templates select="param"/>
    </xsl:template>

    <xsl:template match="koeffs">
        <tr>
            <td>
                <b>Коэффициенты калькуляции страхового продукта</b>
            </td>
            <td></td>
            <td></td>
        </tr>
        <xsl:apply-templates select="param"/>
    </xsl:template>

    <xsl:template match="sum">
        <tr>
            <td>
                <b>Рассчитанная страховая премия</b>
            </td>
            <td></td>
            <td></td>
        </tr>
        <xsl:apply-templates select="param"/>
    </xsl:template>

    <xsl:template match="param">
        <!--
            <tr><td><xsl:value-of select="caption"/> (<xsl:value-of select="name"/>):</td><td></td><td><xsl:value-of select="text"/> (<xsl:value-of select="value"/>)</td></tr>
        -->
        <tr>
            <td>
                <xsl:value-of select="caption"/>
            </td>
            <td></td>
            <td>
                <xsl:value-of select="text"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="paid">
        <tr>
            <td>Оплачивалось ли уже что-либо:</td>
            <td></td>
            <td>
                <xsl:value-of select="paid"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="assist_called">
        <tr>
            <td>Были ли обращения в сервисную компанию:</td>
            <td></td>
            <td>
                <xsl:value-of select="assist_called"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="message" userelativepaths="yes" externalpreview="no" url="..\message_.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml=""
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
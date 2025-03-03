<%@taglib uri="/struts-tags" prefix="s"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@page  contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<pd4ml:transform
    screenWidth="840"
    pageFormat="A4"
    pageOrientation="portrait"
    pageInsets="10,10,10,10,points"
    enableImageSplit="false"
    enableTableBreaks="true">

    <pd4ml:usettf from="java:fonts" />

    <pd4ml:footer
        pageNumberTemplate="Testing"
        titleAlignment="left"
        pageNumberAlignment="left"
        color="#008000" 
        initialPageNumber="1" 
        fontSize="12"
        fontStyle="bold"
        areaHeight="16"/>   

    <HTML>
        <head>
            <link rel="stylesheet" href="/css/PDFstyles.min.css">

            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title><s:text name="app_title"/></title>
        </head>


        <BODY> 

            <div id="logo">
                <table style="width:100%;  background:#FFFFFF;" >
                    <tr>
                        <td width="46%" style="border-width: 0;">
                            <div style="color:#009036; text-align:left; width:100%;">
                                <div style="font-weight:bold;">République Islamique de Mauritanie </div>
                                <div>Honneur - Fraternité - Justice</div>
                                <div style="font-weight:bold;">Agence National du Régistre de la Population </div>
                                <div style="font-weight:bold;">Direction de Recherche et Dévelopment </div>
                            </div>
                        </td> 
                        <td style="text-align:center;border-width: 0;">
                            <div><img src="/images/embleme.png" alt="embleme" width="85px" height="84px"/></div>

                        </td>
                        <td width="46%" style="border-width: 0;">
                            <div style=" color:#009036; text-align:right; width:100%;">
                                <div style="font-weight:bold;">الجمهورية الإسلامية الموريتانية</div>
                                <div>شرف - إخاء - عدالة</div>
                                <div style="font-weight:bold;">الوكالة الوطنية  لسجل السكان  و الوثاءق المؤمنة</div>
                                <div style="font-weight:bold;">إدارة البحث و التطوير</div>
                            </div>
                        </td>


                    </tr>
                </table>
            </div>

            <br><br><br>
        <center>  Statistique de l'utilisation du WebSerice WSOperateur  de la période du <br>
            <table> <tr> <td><div style="font-weight:bold;"> <s:property value="dateDebutAutreFormat" /></td> </div> <td class="exception">au</td>  <td><div style="font-weight:bold;"> <s:property value="dateFinAutreFormat" /></div></td> </tr> </table>
               </center>
            <%
                
                //Mauritel__InfosRetournees:16041_nniInexistant:12433_formatInvalide:0
                
                String retour = (String) request.getAttribute("retourOfAllOperators");
                String[] retourTab = retour.split("__");
                String operatorName = retourTab[0];
                        
                
                String[] infosTab = retourTab[1].split("_");
                
                
                String retourOfAllOperators = (String) request.getAttribute("retourOfAllOperators");
             //   System.out.print("retourOfAllOperators = "+ retourOfAllOperators);
                String[] operators = retourOfAllOperators.split(";");
                String resu[][] = new String[3][3];

                String operator = retourOfAllOperators;
                String mattel = operators[0];
           //     String mauritel = operators[1];
           //     String chinguittel = operators[2];

                String[] operatorTab = operator.split("_");
            //    String[] mauritelTab = mauritel.split("_");
            //    String[] chinguitelTab = chinguittel.split("_");

                String[] inter;

                inter = infosTab[0].split(":");
                resu[0][0] = inter[1];
                inter = infosTab[1].split(":");
                resu[0][1] = inter[1];
                inter = infosTab[2].split(":");
                resu[0][2] = inter[1];
/*
                inter = mauritelTab[0].split(":");
                resu[1][0] = inter[1];
                inter = mauritelTab[1].split(":");
                resu[1][1] = inter[1];
                inter = mauritelTab[2].split(":");
                resu[1][2] = inter[1];

                inter = chinguitelTab[0].split(":");
                resu[2][0] = inter[1];
                inter = chinguitelTab[1].split(":");
                resu[2][1] = inter[1];
                inter = chinguitelTab[2].split(":");
                resu[2][2] = inter[1];
*/
            %>
        <br><br><br> <br><br><br> <br><br><br>
        <table style="width:100%">
            <tr>
                <th>Opérateur / Retour</th>
                <th>InfosRetournees</th>
                <th>nniInexistant</th> 
                <th>formatInvalide</th>
            </tr>
            <tr> 
                <th>  <%= operatorName %></th>
                <th><%=resu[0][0]%></th>
                <th><%=resu[0][1]%></th>
                <th><%=resu[0][2]%></th>

            </tr> 
          
        </table>


    </BODY>
</HTML>
</pd4ml:transform>

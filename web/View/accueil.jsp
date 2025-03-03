<%-- 
    Document   : Jquery_loadDataPageScroll_70
    Created on : Dec 21, 2016, 10:48:13 PM
    Autdor     : macbookpro
--%>


<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>

        <script src="View/js/jquery-3.1.1.js" type="text/javascript"></script>
        <script src="View/js/jquery-ui.js"></script>
        <link href="View/js/jquery-ui.css" rel="stylesheet" />

      
        <script type="text/javascript">

            $(document).ready(function () {

                var progressbarLabel = $('#progressBar-label');
                var progressbarDiv = $('#progressbar');

                var currentPercentage0 = 0;
                var previousPercenage0 = 0;

                var currentPercentage1 = 0;
                var previousPercenage1 = 0;

                var currentPercentage2 = 0;
                var previousPercenage2 = 0;

                var currentNum0 = 0;
                var previousNum0 = 0;

                var currentNum1 = 0;
                var previousNum1 = 0;

                var currentNum2 = 0;
                var previousNum2 = 0;

                $("#myButton").button({
                    disabled: true
                });

                $("#pdfButton").button({
                    disabled: true
                });

                $('input[type="text"]').on("change", function () {

                    if ($("#dateNaissanceDebut").val().length > 0 &&
                            $("#dateNaissanceFin").val().length > 0 ) {

                        var bol =true;
                        if(($("#dateNaissanceDebut").val() < $("#dateNaissanceFin").val())){
                            bol= false
                        }    
                        $("#myButton").button({
                            disabled: bol
                        });

                        $("#pdfButton").button({
                            disabled: bol
                        });
                    }

                });

                $('input[type="text"]').on("change", function () {

                    if ($("#dateNaissanceDebut").val().length === 0 && $("#dateNaissanceFin").val().length === 0) {

                        $("#myButton").button({
                            disabled: true
                        });

                        $("#pdfButton").button({
                            disabled: true
                        });
                    }

                });

                $('input[type="text"]').on("change", function () {

                    if ($("#dateNaissanceDebut").val().length === 0 || $("#dateNaissanceFin").val().length === 0) {

                        $("#myButton").button({
                            disabled: true
                        });

                        $("#pdfButton").button({
                            disabled: true
                        });
                    }

                });



                $('#dateNaissanceDebut').datepicker({
                    dateFormat: 'yy-mm-dd',
                    changeMontd: true,
                    changeYear: true
                });

                $('#dateNaissanceFin').datepicker({
                    dateFormat: 'yy-mm-dd',
                    changeMontd: true,
                    changeYear: true
                });

                $("#operateur").selectmenu({
                    width: 172
                });

                $("#myButton").button();
                $("#pdfButton").button();

                $('#pd4ml').click(function () {

                    $.ajax({
                        url: 'sendStatistiqueInPDF',
                        type: 'GET',
                        data: {
                            
                        // 'operateur': $('#operateur').val(),
                         //   'dateDebut': $('#dateNaissanceDebut').val(),
                            'dateFin': $('#dateNaissanceFin').val()
                        },
                        success: function (result) {

                        }
                    });

                });

                $('input[type="text"]').each(function () {
                    if ($(this).val() != "") {
                        empty = false;
                        return false;
                    }
                });

                $('#myButton').click(function () {


                    $.ajax({
                        url: 'sendStatistique',
                        type: 'GET',
                        data: {
                            'operateur': $('#operateur').val(),
                            'dateDebut': $('#dateNaissanceDebut').val(),
                            'dateFin': $('#dateNaissanceFin').val()
                        },
                        success: function (result) {
                            //$("#div1").html(result);

                            setTimeout(function () {
                                var data = result.retour.split("_");

                                var correct = parseInt(data[0].split(":")[1]);
                                var noneExistant = parseInt(data[1].split(":")[1]);
                                var notCorrect = parseInt(data[2].split(":")[1]);


                                //progressbarLabel.text('Complete');
                                progressbarDiv.fadeOut(1);


                                previousPercenage0 = currentPercentage0;
                                currentPercentage0 = Math.floor(correct * 100.0 / (correct + noneExistant + notCorrect));
                                previousNum0 = currentNum0;
                                currentNum0 = correct;


                                previousPercenage1 = currentPercentage1;
                                currentPercentage1 = Math.floor(noneExistant * 100 / (correct + noneExistant + notCorrect));
                                previousNum1 = currentNum1;
                                currentNum1 = noneExistant;


                                previousPercenage2 = currentPercentage2;
                                currentPercentage2 = Math.floor(notCorrect * 100 / (correct + noneExistant + notCorrect));
                                previousNum2 = currentNum2;
                                currentNum2 = notCorrect;

                                if ((currentPercentage0 + currentPercentage1 + currentPercentage2) > 100) {
                                    currentPercentage0 = currentPercentage0 - 1;
                                }

                                if ((currentPercentage0 + currentPercentage1 + currentPercentage2) < 100) {
                                    currentPercentage0 = currentPercentage0 + 1;
                                }

                                animateProgressBar(previousPercenage0, currentPercentage0, previousNum0, currentNum0, "innerDiv0", "InfosRetournees: ");
                                animateProgressBar(previousPercenage1, currentPercentage1, previousNum1, currentNum1, "innerDiv1", "nniInexistant: ");
                                animateProgressBar(previousPercenage2, currentPercentage2, previousNum2, currentNum2, "innerDiv2", "formatInvalide: ");

                                $("#myButton").button({
                                    disabled: false
                                });



                            }, 1000);
                            //$("#code2").html(data[0]);
                            //$("#code1").html(data[1]);
                            //$("#code4").html(data[2]);
                            //alert(data[0]);
                        }
                    });


                    $("#myButton").button({
                        disabled: true
                    });


                    progressbarLabel.text('Loading...');
                    progressbarDiv.progressbar({
                        value: false
                    }).fadeIn(1);


                    //alert($('#dateNaissanceDebut').val());
                    //alert($('#dateNaissanceFin').val());
                    //alert($('#operateur').val());
                });

                function animateProgressBar(previousPercenage, currentPercentage, previousNum, currentNum, innerDiv, label) {
                    $('#' + innerDiv).animate({
                        'width': (500 * currentPercentage) / 100
                    }, 2000);

                    if (previousPercenage > currentPercentage)
                        currentPercentage = currentPercentage - 1;

                    $({counter: previousPercenage}).animate({counter: currentPercentage}, {
                        duration: 2000,
                        step: function () {
                            $('#' + innerDiv).text(Math.ceil(this.counter) + '%');
                        }
                    });

                    if (previousNum > currentNum)
                        currentNum = currentNum - 1;



                    $({counter: previousNum}).animate({counter: currentNum}, {
                        duration: 2000,
                        step: function () {
                            $('#label' + innerDiv).text(label + Math.ceil(this.counter));
                        }
                    });
                }

            });


        </script>
    </head>
    <body style="font-family:Arial">

        <br><br><br><br>
    <center>
        <h2 style="margin-bottom:40px;color:#1c94c4;"> Statistique du WebService WSOperateur : </h2>
        <form id="form1" target="_blank" name="personne" action="sendStatistiqueOfAllOperators" >
            <table> 

                <tr>
                    <td>     
 
                        <table>
                            <tr> 
                                <td>Operateur :</td>
                                <!--
                                <td> <select name="operateur" id="operateur">
                                        <option value="Mattel">Mattel</option>
                                        <option value="Mauritel">Mauritel</option>
                                        <option value="Chinguitel">Chinguitel</option>
                                    </select>
                                </td>
                                -->
                                
                                
                                
                                
                                
                                <td>
    <select name="operateur" id="operateur">
        <%
            // Change the path to the location of your text file.
            String filePath = application.getRealPath("/WEB-INF/operateur.txt");
            java.io.File file = new java.io.File(filePath);
            if(file.exists()){
                java.io.BufferedReader br = new java.io.BufferedReader(new java.io.FileReader(file));
                String line;
                // Skip the header line.
                if((line = br.readLine()) != null){
                    // header is ignored
                }
                while((line = br.readLine()) != null){
                    String[] parts = line.split(",");
                    if(parts.length >= 2){
                        String id = parts[0].trim();
                        String libelle = parts[1].trim();
        %>
                        <option value="<%= id %>"><%= libelle %></option>
        <%
                    }
                }
                br.close();
            } else {
        %>
                <option value="">No data available</option>
        <%
            }
        %>
    </select>
</td>
                                
                                
                                
                                
                                

                            </tr>
                            <tr> 
                                <td>Date debut :</td>
                                <td><input type="text" name="dateDebut" id="dateNaissanceDebut" ></td>

                            </tr>
                            <tr> 
                                <td>Date fin :</td>
                                <td><input type="text" name="dateFin"  id="dateNaissanceFin" ></td>

                            </tr>

                            <tr>
                                <td><input type="submit" value="pdf" id="pdfButton"  ></td>
                                <td colspan="3" > <input type="button" value="submit" id="myButton" ></td></center>
                            </tr>
                        </table>
                        </form>


                    </td> 
                    <td> 

                        <table>
                            <tr> 

                                <td>
                                    <div id="labelinnerDiv0" >InfosRetournees: </div> 
                                    <div id="outerDiv" style="background-color:#EEEEEE;
                                         height:20px; width:500px; padding:5px">
                                        <div id="innerDiv0" style="background-color:greenyellow; height:19px;
                                             width:0px; color:violet; text-align:center">
                                        </div>
                                    </div>
                                </td>
                            </tr> 
                            <tr> 
                                <td>
                                    <div id="labelinnerDiv1" >nniInexistant: </div>
                                    <div id="outerDiv" style="background-color:#EEEEEE;
                                         height:20px; width:500px; padding:5px">
                                        <div id="innerDiv1" style="background-color:greenyellow; height:19px;
                                             width:0px; color:violet; text-align:center">
                                        </div>
                                    </div> 
                                </td>
                            </tr> 
                            <tr> 
                                <td>
                                    <div id="labelinnerDiv2" >formatInvalide: </div>
                                    <div id="outerDiv" style="background-color:#EEEEEE;
                                         height:20px; width:500px; padding:5px">
                                        <div id="innerDiv2" style="background-color:greenyellow; height:19px;
                                             width:0px; color:violet; text-align:center">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>     
                </tr> 
            </table> 

            <div style="width: 300px">
                <div id="progressbar" style="position: relative; display: none">
                    <span style="position: absolute; left: 35%; top: 20%" id="progressBar-label">
                        Uploading...
                    </span>
                </div>
            </div>


    </center> 




</body>
</html>



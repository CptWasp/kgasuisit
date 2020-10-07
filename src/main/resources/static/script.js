
// ######################################################################################                  
// ##################### при выборе из чекбоксов, достать из сервера строки #############
// ######################################################################################  

        $(document).ready(function(){
            var keyword_string = "";
            $(".chbx_inpt").on("click", function(){
                
                if($(this).is(":checked")){
                    keyword_string = keyword_string + "%"+$(this).val()+"%";
                    $("#inptval").attr("placeholder", keyword_string);
                }else{
                    keyword_string = keyword_string.replace("%"+$(this).val()+"%", "");
                    $("#inptval").attr("placeholder", keyword_string);
                }
                
                $.ajax({
                    type: "POST",
                    url: "echo.php",
                    data: {data: keyword_string},
                    success: function(response){
                        $("#cont0").html(response);
                    }    
                });
                
                $.ajax({
                    type: "POST",
                    url: "onemorerow.php",
                    data: {data: keyword_string},
                    success: function(response){
                        var arr = response.split(',');
//                        $.unique(arr);
                        
                        var newArray = arr.filter(function(elem, pos) {
                            return arr.indexOf(elem) == pos;
                        });
                        
                        $("#dropdown_menu").empty();
                        for(var j=0; j<newArray.length; j++){
                            console.log(newArray[j]);
                            $("#dropdown_menu").prepend("<input class='chbx_inpt' type='checkbox' value='"+newArray[j].replace(']','').replace('[','')+"'>"+newArray[j].replace(']','').replace('[','')+"<br>");
                        }   
                    }    
                });
                
                
            });
         });  
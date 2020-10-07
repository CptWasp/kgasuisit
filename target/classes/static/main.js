
    $(document).ready(function(){
        var inputs_value = "";
        
        $("#dropdown_menu").on("click", "input", function(){
                if($(this).is(":checked")){
                    inputs_value = inputs_value + "%"+$(this).val()+"%";
                    $("#inptval").attr("placeholder", inputs_value);
                }else{
                    inputs_value = inputs_value.replace("%"+$(this).val()+"%", "");
                    $("#inptval").attr("placeholder", inputs_value);
                }    
            });
        
        
        
        
        $("#btn_0").on("click",function(){
            $.ajax({
                    type: "POST",
                    url: "echo.php",
                    data: {data: inputs_value},
                    success: function(response){
                        $("#cont0").html(response);
                    }    
                });
            
            
            $.ajax({
                    type: "POST",
                    url: "onemorerow.php",
                    data: {data: inputs_value},
                    success: function(response){
                        var arr = response.split(',');
                        
                        var newArray = arr.filter(function(elem, pos) {
                            return arr.indexOf(elem) == pos;
                        });
                        
                        $("#dropdown_menu").empty();
                        for(var j=0; j<newArray.length; j++){
                            var newArrayString = newArray[j].replace(']','').replace('[','').replace('"','').replace(')','').replace('(','').replace(' ','');
                            console.log(newArray[j]);
                            $("#dropdown_menu").prepend("<input class='chbx_inpt' type='checkbox' value='"+newArrayString+"'>"+newArrayString+"<br>");
                        }   
                    }    
                });
            
            
            
        });
        
    });
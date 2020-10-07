
// ######################################################################################                  
// #### при вводе текста показывать те слова в которых есть введенное сочетание букв ####
// ######################################################################################           
         
         document.querySelector('#inptval').oninput = function(){
             let val = this.value.trim();
             let elasticItems = document.querySelectorAll('.elastic li');
             
             if(val!=''){
                 elasticItems.forEach(function(elem){
                     if(elem.innerText.search(val) == -1){
                         elem.classList.add('hide');
                         elem.innerHTML = elem.innerText;
                     }else{
                         elem.classList.remove('hide');
                         let strng_str = elem.innerText;
                         elem.innerHTML = insertMark(strng_str, elem.innerText.search(val), val.length);
                     }
                 });
             }else{
                 elasticItems.forEach(function(elem){
                     elem.classList.remove('hide');
                     elem.innerHTML = elem.innerText;
                 });
             }   
         }
         
// ######################################################################################                  
// ########### обводить маркером сочетание букв совподающие с введенными ################
// ######################################################################################         
         
         function insertMark(strng, pos, len){
             // Hello world
             // Hello <mark>+wo+</mark>+rld 
             return strng.slice(0, pos)+'<mark>'+strng.slice(pos, pos+len)+'</mark>'+strng.slice(pos+len);
         }
$(function(){
    
  
    $(".dntshow").on('click', function(e){
        e.preventDefault();
        window.location.href=$(this).attr('href');  
        
        return false;
    });


});



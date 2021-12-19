$(document).ready(function(){
	
  
	
    $(".goods-wrap .search-menu > .search-box > button").click(function(){
      
      var indexNum = $(this).index();
      console.log(indexNum);
      if($(this).hasClass("on")){
        
        $(".goods-wrap .search-menu > .search-box > button").removeClass("on");
        
      } else{
  
        $(".goods-wrap .search-menu > .search-box > button").removeClass("on");
        $(".goods-wrap .search-menu > .search-box > button").eq(indexNum).addClass("on");
        
      }
   
    });
    
    
  });
  
  
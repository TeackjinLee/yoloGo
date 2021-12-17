$(document).ready(function(){
	
	// 객실 선택 뷰
  const tabList = document.querySelectorAll('.tab_btn ul li');
  const contents = document.querySelectorAll('.tab_each ul');
  let activeCont = "";// 현재 활성화 된 컨텐츠

  for(var i = 0; i < tabList.length; i++){
      tabList[i].querySelector('.tab_btn ul li a').addEventListener('click', function(e){
        e.preventDefault();
        for(var j = 0; j < tabList.length; j++){
          // 나머지 버튼 클래스 제거
          tabList[j].classList.remove('active');

          // 나머지 컨텐츠 display:none 처리
          contents[j].style.display = 'none';
        }

        // 버튼 관련 이벤트
        this.parentNode.classList.add('active');

        // 버튼 클릭시 컨텐츠 전환
        activeCont = this.getAttribute('href');
        document.querySelector(activeCont).style.display = 'block';
      });
    }

  
	
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
  
  
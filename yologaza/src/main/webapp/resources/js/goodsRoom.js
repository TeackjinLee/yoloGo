$(document).ready(function(){ 
$('.slider-single').slick({
 	slidesToShow: 1,
 	slidesToScroll: 1,
 	arrows: false,
 	fade: false,
 	adaptiveHeight: true,
 	infinite: false,
	useTransform: true,
 	speed: 400,
 	cssEase: 'cubic-bezier(0.77, 0, 0.18, 1)',
 });

 $('.slider-nav')
 	.on('init', function(event, slick) {
 		$('.slider-nav .slick-slide.slick-current').addClass('is-active');
 	})
 	.slick({
 		slidesToShow: 3,
 		slidesToScroll: 3,
 		dots: false,
 		focusOnSelect: false,
 		infinite: false,
 		responsive: [{
 			breakpoint: 1024,
 			settings: {
 				slidesToShow: 5,
 				slidesToScroll: 5,
 			}
 		}, {
 			breakpoint: 640,
 			settings: {
 				slidesToShow: 4,
 				slidesToScroll: 4,
			}
 		}, {
 			breakpoint: 420,
 			settings: {
 				slidesToShow: 3,
 				slidesToScroll: 3,
		}
 		}]
 	});

 $('.slider-single').on('afterChange', function(event, slick, currentSlide) {
 	$('.slider-nav').slick('slickGoTo', currentSlide);
 	var currrentNavSlideElem = '.slider-nav .slick-slide[data-slick-index="' + currentSlide + '"]';
 	$('.slider-nav .slick-slide.is-active').removeClass('is-active');
 	$(currrentNavSlideElem).addClass('is-active');
 });

 $('.slider-nav').on('click', '.slick-slide', function(event) {
 	event.preventDefault();
 	var goToSingleSlide = $(this).data('slick-index');

 	$('.slider-single').slick('slickGoTo', goToSingleSlide);
 });

// 객실 선택 뷰
const tabList = document.querySelectorAll('.tab_btn ul li');
const contents = document.querySelectorAll('.tab_each ul')
let activeCont = '';// 현재 활성화 된 컨텐츠

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

  
  
  
//   룸 슬라이드
  $('.room-pic-box').on('init', function(event, slick){  
    $(".test-slider .img-box").eq(1).addClass("active");
    $(".page-num > .current-txt").text(1);
  });
  $(".room-pic-box").slick({
    arrows: true ,
    dots: false ,
    autoplay: false ,
    slidesToShow: 1,
    autoplaySpeed: 1000 
  });
  $('.room-pic-box').on('afterChange', function(event, slick, currentSlide){
   console.log(currentSlide);
    $(".room-pic-box .img-box").removeClass("active");
    $(".room-pic-box .img-box").eq(currentSlide+1).addClass("active");
    $(".page-num > .current-txt").text(currentSlide+1);
    
});


});


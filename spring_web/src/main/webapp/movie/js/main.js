$(document).ready(function() {
    // 배너 자동 슬라이드 설정
    var currentIndex = 0;
    var bannerItems = $('.banner-item');
    var dots = $('.dot');
    var totalItems = bannerItems.length;
    var slideInterval;

    // 배너 슬라이드 함수
    function showBanner(index) {
        bannerItems.removeClass('active');
        dots.removeClass('active');
        
        bannerItems.eq(index).addClass('active');
        dots.eq(index).addClass('active');
    }

    // 다음 배너로 이동
    function nextBanner() {
        currentIndex = (currentIndex + 1) % totalItems;
        showBanner(currentIndex);
    }

    // 이전 배너로 이동
    function prevBanner() {
        currentIndex = (currentIndex - 1 + totalItems) % totalItems;
        showBanner(currentIndex);
    }

    // 자동 슬라이드 시작
    function startAutoSlide() {
        slideInterval = setInterval(nextBanner, 5000);
    }

    // 자동 슬라이드 정지
    function stopAutoSlide() {
        clearInterval(slideInterval);
    }

    // 다음 버튼 클릭 이벤트
    $('.banner-next').click(function() {
        stopAutoSlide();
        nextBanner();
        startAutoSlide();
    });

    // 이전 버튼 클릭 이벤트
    $('.banner-prev').click(function() {
        stopAutoSlide();
        prevBanner();
        startAutoSlide();
    });

    // 점 클릭 이벤트
    dots.each(function(index) {
        $(this).click(function() {
            stopAutoSlide();
            currentIndex = index;
            showBanner(currentIndex);
            startAutoSlide();
        });
    });

    // 배너에 마우스 진입시 자동슬라이드 정지
    $('.banner-section').mouseenter(function() {
        stopAutoSlide();
    });

    // 배너에서 마우스 떠날 때 자동슬라이드 재개
    $('.banner-section').mouseleave(function() {
        startAutoSlide();
    });

    // 초기 설정
    showBanner(0);
    startAutoSlide();

    // 더보기 버튼 클릭 이벤트
    $('.more-button').click(function() {
        alert('공지사항 더보기 페이지로 이동합니다.');
        // 실제 구현 시 페이지 이동: window.location.href = '/notice/list';
    });
});

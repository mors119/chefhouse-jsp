$(function () {
  let userId = window.localStorage.getItem('id');
  console.log(userId);
  if (userId) {
    $('#header .header_top li:first-child>a').text(userId);
  }
  // ****header sitemap
  $('#header .sitemap_btn').on('click', function () {
    $(this).toggleClass('on');
    $('#header .menu_wrap').toggleClass('on');
    $('#container').toggleClass('on');
  });
  // on toggle시 scroll 막기
  let clickX = true;
  $('#header .sitemap_btn').on('click', function () {
    if (clickX) {
      $('body').addClass('on');
    } else {
      $('body').removeClass('on');
    }
    clickX = !clickX;
  });

  // header scroll event
  $(window).on('scroll', function () {
    let _scrollY = $(window).scrollTop();
    if (_scrollY > 38) {
      $('header').addClass('fixed');
    } else {
      $('header').removeClass('fixed');
    }
    if (_scrollY < 38) {
      $('.go_top_btn').addClass('topBtn');
    } else {
      $('.go_top_btn').removeClass('topBtn');
    }
  });

  // swiper
  let mainBanner = new Swiper('.main_banner .swiper', {
    loop: true,
    speed: 2000,
    disableOnInteraction: false,
    autoplay: {
      delay: 3000,
    },
    pagination: {
      el: '.swiper-pagination',
      renderBullet: function (index, className) {
        return '<span class="' + className + '">' + (index + 1) + '</span>';
      },
      clickable: true,
    },
  });

  let mainMenu = new Swiper('.main_menu .swiper', {
    loop: true,
    pagination: {
      el: '.swiper-pagination',
      type: 'fraction',
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
    on: {
      slideChange: function () {
        $('.main_menu .menu_txt.on').removeClass('on');
        $('.main_menu .menu_txt').eq(this.realIndex).addClass('on');
      },
    },
  });

  let mainStory = new Swiper('.main_story .swiper', {
    slidesPerView: 'auto',
    spaceBetween: 15,
    breakpoints: {
      768: {
        slidesPerView: 3,
        spaceBetween: 28,
      },
    },
    scrollbar: {
      el: '.swiper-scrollbar',
      draggable: true,
    },
  });

  let mainReview = new Swiper('.main_review .swiper', {
    slidesPerView: 'auto',
    spaceBetween: 20,
    loop: true,
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });

  function scrollEvent() {
    if (!$('.main_menu .menu').length) return;

    const menuEl = $('.main_menu .menu');
    const storyEl = $('.main_story .swiper-slide');
    const newsEl = $('.main_news .news_wrap');
    const reviewEl = $('.main_review .review');
    let isScroll = false;

    $(window)
      .on('scroll', function () {
        let menuY = menuEl.offset().top - $(this).outerHeight();
        let storyY = storyEl.offset().top - $(this).outerHeight();
        let newsY = newsEl.offset().top - $(this).outerHeight();
        let reviewY = reviewEl.offset().top - $(this).outerHeight();
        let st = $(this).scrollTop();

        if (st >= menuY && !isScroll) {
          menuEl.addClass('view');
        }

        if (st >= storyY && !isScroll) {
          storyEl.addClass('view');
        }

        if (st >= newsY && !isScroll) {
          newsEl.children().addClass('view');
        }

        if (st >= reviewY && !isScroll) {
          reviewEl.addClass('active');
        }
      })
      .trigger('scroll');
  }
  scrollEvent();

  // #header 바로가기
  $('.go_top_btn').on('click', function (e) {
    e.preventDefault();

    $('html, body').animate(
      {
        scrollTop: 0,
      },
      1000
    );
  });
  // 로그인 기능 구현
  $('.login_page .login_btn').on('click', function (e) {
    e.preventDefault();
    let userEmail = $('#userEmail').val();
    if (userEmail === 'aaa') {
      window.localStorage.setItem('id', userEmail);
      location.href = 'index.html';
    }
  });
	
});

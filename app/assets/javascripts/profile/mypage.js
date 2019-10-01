$(document).on('turbolinks:load', function() {
  $(function(){
    $('section').hide().eq(0).show();
    $('.profile-bottom-bar li').eq(0).addClass('border-blue');
    // クリックしたタブが何番目のタブかをcontentに取得
    $('.profile-bottom-bar li').on('click',function(){
      var content = $('.profile-bottom-bar li').index(this);
      // 取得した番号と同じ番号のセクションを取得
      $('section').eq(content).show().siblings().hide();
      $('.profile-bottom-bar li').eq(content).addClass('border-blue').siblings().removeClass('border-blue');
    });
  })
});
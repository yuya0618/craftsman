$(document).on('turbolinks:load', function() {
  $(function() {
    $('#build-btn').click(
      function(){
        $('#build-modal').fadeIn();
      }
    );
  });

  $(function() {
    $('#back-build-btn').click(
      function(){
        $('#build-modal').fadeOut();
      }
    );
  });

  $(function() {
    $('#release-btn').click(
      function(){
        $('#release-modal').fadeIn();
      }
    );
  });

  $(function() {
    $('#back-release-btn').click(
      function(){
        $('#release-modal').fadeOut();
      }
    );
  });

});

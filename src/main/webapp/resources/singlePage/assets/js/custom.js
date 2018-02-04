$(document).ready(function() {

  // $("main#spapp > section").height($(document).height() - 60);

  var app = $.spapp({pageNotFound : 'error_404'}); // initialize

  // define routes
  app.route({
    view: 'users',
    onCreate: function() {
        // getPageUsers();
    },
    onReady: function() {
      getPageUsers();
    }
  });
  app.route({view: 'dashboard', load: 'dashboard',onReady: function() {
      ajaxOnlineUsersChart();
  } });
  app.route({
    view: 'view_3', 
    onCreate: function() { $("#view_3").append("I'm the third view"); }
  });

  // run app
  app.run();

});
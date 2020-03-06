window.whenReady(function () {
  if ($(window).height() < $('html').height()) {
    $('footer').removeClass('hide');
  } else if (window.location.pathname.split("/")[1] == 'chat') {
    $('footer').addClass()('hide');
  }
});


// window.whenReady(() => {
//   if (window.location.pathname.split("/")[1] == 'chat') {
//     if (window.location.pathname.split("/")[1] == 'chat') {
//       $('footer').removeClass()('hide');
//     }
//   }
// });
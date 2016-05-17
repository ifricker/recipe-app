$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()




  $('ul.main-recipes-list').bsPhotoGallery({
    "classes" : "col-lg-3 col-md-4 col-sm-6 col-xs-12 col-xxs-12",
    "hasModal" : true
  });
});


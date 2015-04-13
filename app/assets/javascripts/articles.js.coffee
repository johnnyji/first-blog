# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      morePosts = $('.pagination .next_page').attr('href')
      if morePosts && $(window).scrollTop() > $(document).height() - $(window).height() - 150
        $('.pagination').html("<p class='show-more'>Loading more posts...</p>")
        $.getScript(morePosts)
    $(window).scroll
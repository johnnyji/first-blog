# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      morePosts = $('.pagination .next_page a').attr('href')
      if morePosts && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('.pagination').text('Loading more posts...')
        $.getScript(morePosts)
    $(window).scroll
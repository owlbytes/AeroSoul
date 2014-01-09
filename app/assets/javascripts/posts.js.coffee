console.log('here')
$ ->
  $('a.load-more-posts').on 'inview', (e, visible) ->
    console.log('loading more posts')
    return unless visible
    
    $.getScript $(this).attr('href')
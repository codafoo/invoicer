page = require('webpage').create()
page.open 'http://invoicer.dev', (status) ->
  title = page.evaluate -> document.title
  console.log "Title: #{title}"
  phantom.exit()
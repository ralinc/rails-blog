$ ->
  loadFacebookSDK()
  bindFacebookEvents() unless window.fbEventsBound

bindFacebookEvents = ->
  $(document)
    .on('turbolinks:request-start', saveFacebookRoot)
    .on('turbolinks:load', restoreFacebookRoot)
    .on('turbolinks:load', ->
      FB?.XFBML.parse()
    )
  @fbEventsBound = true

saveFacebookRoot = ->
  if $('#fb-root').length
    @fbRoot = $('#fb-root').detach()

restoreFacebookRoot = ->
  if @fbRoot?
    if $('#fb-root').length
      $('#fb-root').replaceWith @fbRoot
    else
      $('body').append @fbRoot

loadFacebookSDK = ->
  window.fbAsyncInit = initializeFacebookSDK
  $.getScript("//connect.facebook.net/en_US/sdk.js")

initializeFacebookSDK = ->
  FB.init
    appId  : '1772620649623244'
    status : true
    cookie : true
    xfbml  : true
    version: 'v2.7'

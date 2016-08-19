#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require social-share-button
#= require_tree .

document.addEventListener "turbolinks:load", (event) ->
  ga("set", "location", event.data.url)
  ga("send", "pageview")

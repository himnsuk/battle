# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  # Autocomplete code

  if $('#search').length > 0
    $('#search').autocomplete(
      autoFocus: true
      source: '/battle/search'
    )

  $("#list-battle").on "click", (e) ->
    term = $("#search").val()
    if(term != "")
      url = "/battle/list_ui?term=" + term
      $.ajax
        url: url
        type: "GET"
        success: (result) ->
          $("#battle-list").html(result)
          return
        error: (result) ->
          console.log result
          return
    return
  return

$(document).on "ready page:load", ->

  $("ul").on "change", "[data-sync]", ->
    self = $(this)
    ajaxOptions = 
      method: "PATCH"
      data:
        checked: if this.checked then "1" else "0"
    $.ajax(self.data("sync"), ajaxOptions).done (data) ->
      console.log data

  $("[data-new-todo]").on "submit", (event) ->
    event.preventDefault()
    self = $(this)
    list = $("ul")
    data = {}
    self.find("input[type=text]").val("")
    $.each self.serializeArray(), -> data[this.name] = this.value
    $.post self.attr("action"), data, (data) ->
      todo = $("li", data).first()
      list.append todo

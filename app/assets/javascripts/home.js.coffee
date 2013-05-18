$(document).ready ->
  $("select#state").change ->
    sendData = new Object()
    sendData.role_id = @.value
    sendData.user_id = @.parentNode.parentNode.getAttribute 'user_id'
    $.ajax({
      url: "/users/changeRole"
      method: "post"
      data: sendData
      error: (jqXHR, textStatus, errorThrown)->
        alert textStatus + " : " + errorThrown
    })
window.save_status = (id)->
  td = $("[status_id=" + id + "]")
  inputs = $("input[type=text]", td)
  sendData = new Object()
  name = inputs.eq(0)
  link = inputs.eq(1)
  if(name.val() == "" || link.val() == "")
    alert("name and link cannot be empty!");
  return
  sendData.id = id
  sendData.name = name.val()
  sendData.link = link.val()
  $.ajax({
    url: "/statuses/change"
    method: "post"
    data: sendData
    error: (jqXHR, textStatus, errorThrown)->
      alert textStatus + " : " + errorThrown
  })
window.delete_status = (id)->
  sendData = new Object()
  sendData.id = id
  $.ajax({
    url: "/statuses/delete"
    method: "post"
    data: sendData
    success: ->
      table = document.getElementById('table')
      rowCount = table.rows.length
      for i in [1..rowCount - 2]
        row = table.rows[i]
        if(row.getAttribute('status_id').toString() == id.toString())
          table.deleteRow(i)
          break

    error: (jqXHR, textStatus, errorThrown)->
      alert textStatus + " : " + errorThrown
  })
window.create_new_status = ->
  name = $('#new_status_name')
  link = $('#new_status_link')
  if(name.val() == "" || link.val() == "")
    alert("name and link cannot be empty!");
  return
  sendData = new Object()
  sendData.name = name.val()
  sendData.link = link.val()
  $.ajax({
    url: "/statuses/create"
    method: "post"
    data: sendData
    success: (id)->
      table = document.getElementById('table')
      newRow = table.insertRow(table.rows.length - 1)
      newRow.setAttribute("status_id", id)
      cell1 = newRow.insertCell(0)
      cell2 = newRow.insertCell(1)
      cell3 = newRow.insertCell(2)
      cell4 = newRow.insertCell(3)
      status_edit = document.createElement("input")
      status_edit.setAttribute("type", "text")
      status_edit.setAttribute("value", name.val())
      status_edit.setAttribute("size", name.attr('size'))
      cell1.appendChild(status_edit)
      link_edit = document.createElement("input")
      link_edit.setAttribute("type", "text")
      link_edit.setAttribute("value", link.val())
      link_edit.setAttribute("size", link.attr('size'))
      save_button = document.createElement("input")
      save_button.setAttribute("type", "button")
      save_button.setAttribute("value", "v")
      save_button.setAttribute("onclick", "save_status(" + id + ")")
      delete_button = document.createElement("input")
      delete_button.setAttribute("type", "button")
      delete_button.setAttribute("value", "x")
      delete_button.setAttribute("onclick", "delete_status(" + id + ")")
      cell1.appendChild(status_edit)
      cell2.appendChild(link_edit)
      cell3.appendChild(save_button)
      cell4.appendChild(delete_button)
      name.val("")
      link.val("")
    error: (jqXHR, textStatus, errorThrown)->
      alert textStatus + " : " + errorThrown
  })

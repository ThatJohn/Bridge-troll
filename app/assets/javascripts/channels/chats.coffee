App.chats = App.cable.subscriptions.create "ChatsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    $messages = $('#messages')
    $('#messages').scrollTop(50000)

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append data
    $messages = $('#messages')
    $('#messages').scrollTop(50000)

  speak: (message) ->
    @perform 'speak', message: message, region: $("#region").val()

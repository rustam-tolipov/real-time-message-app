import consumer from './consumer';

consumer.subscriptions.create('ChatroomChannel', {
  connected() {
    console.log('connected to chatroom channel 🥳🎉');
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // #message-container is the id of the div that will contain the messages
    // {foo: 'fsadfdsafsadf'}
    console.log(data.mod_message);

    const messageDiv = document.getElementById('message-container');
    messageDiv.innerHTML += `<p>${data.mod_message}</p>`;
  },
});

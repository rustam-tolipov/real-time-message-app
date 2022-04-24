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
    const chatBox = document.querySelector('.chat-box');
    const messageDiv = document.getElementById('message-container');
    const messageInput = document.getElementById('message-input');
    messageDiv.innerHTML += `<p>${data.mod_message}</p>`;
    messageInput.value = '';

    chatBox.scrollTop = chatBox.scrollHeight;
  },
});

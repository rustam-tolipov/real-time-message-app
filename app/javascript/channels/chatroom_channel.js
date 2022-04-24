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
    console.log(data);

    const element = document.getElementById('user-id');
    const user_id = Number(element.getAttribute('data-user-id'));
    console.log(user_id);

    let html;

    if (user_id === data.message.user_id) {
      html = data.mine;
    } else {
      html = data.theirs;
    }

    const chatBox = document.querySelector('.chat-box');
    const messageDiv = document.getElementById('message-container');
    const messageInput = document.getElementById('message-input');
    messageDiv.innerHTML += html;
    messageInput.value = '';

    chatBox.scrollTop = chatBox.scrollHeight;
  },
});

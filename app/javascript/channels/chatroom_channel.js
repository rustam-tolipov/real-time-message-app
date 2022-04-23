import consumer from './consumer';

consumer.subscriptions.create('ChatroomChannel', {
  connected() {
    console.log('connected to chatroom channel 🥳🎉');
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data.foo);
  },
});

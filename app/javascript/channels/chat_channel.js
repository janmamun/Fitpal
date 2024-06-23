import consumer from "./consumer"

const chatChannel = consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const messages = document.getElementById('messages');
    messages.insertAdjacentHTML('beforeend', data.message);
  },

  send_message(message, receiver_id) {
    this.perform('send_message', { chat: { message: message, receiver_id: receiver_id } });
  }
});

document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('new_message');
  if (form) {
    form.addEventListener('submit', (event) => {
      event.preventDefault();
      const messageField = form.querySelector('textarea');
      chatChannel.send_message(messageField.value, form.querySelector('input[name="chat[receiver_id]"]').value);
      messageField.value = '';
    });
  }
});

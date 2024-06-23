document.addEventListener('DOMContentLoaded', () => {
  const chatChannel = App.cable.subscriptions.create({ channel: "ChatChannel", chat_id: <%= params[:chat_id] %> }, {
    received(data) {
      const messages = document.getElementById('messages');
      messages.insertAdjacentHTML('beforeend', data.message);
    },
    send_message(message, receiver_id) {
      this.perform('send_message', { chat: { message: message, receiver_id: receiver_id } });
    }
  });

  const form = document.getElementById('new_message');
  form.addEventListener('submit', (event) => {
    event.preventDefault();
    const messageField = form.querySelector('textarea');
    const receiverIdField = form.querySelector('input[name="chat[receiver_id]"]');
    chatChannel.send_message(messageField.value, receiverIdField.value);
    messageField.value = '';
  });
});

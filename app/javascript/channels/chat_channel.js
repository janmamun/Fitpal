import consumer from "./consumer"

const chatChannel = consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const messages = document.getElementById('messages')
    messages.insertAdjacentHTML('beforeend', data.message)
  },

  speak(message) {
    return this.perform('speak', { message: message });
  }
});

document.addEventListener('turbolinks:load', () => {
  const form = document.getElementById('new_message')
  if (form) {
    const textarea = form.querySelector('textarea')

    form.addEventListener('submit', (event) => {
      event.preventDefault()
      const message = textarea.value
      if (message.trim().length > 0) {
        chatChannel.speak(message)
        textarea.value = ''
      }
    })
  }
});

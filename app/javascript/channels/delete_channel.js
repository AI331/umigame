import consumer from "./consumer"

consumer.subscriptions.create("DeleteChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const container = document.getElementById(`question-${data.content.id}`);
    const HTML = '';
    if (container) {
    container.parentNode.removeChild(container);
    container.insertAdjacentHTML('beforeend', HTML);
    }
  },
});



  
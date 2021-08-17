import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const MessagesContent = `<p>${data.content.messages_content}</p>`;
    const CreatedAt = `<p>${data.content.created_at}</p>`;
    const Nickname = `<p>${data.user.nickname}</p>`;
    const HTML = `
    <div class="message-content">
      <div class="message-user">
        <p>${Nickname}</p>
      </div>
      <div class="created-at">
        <p>${CreatedAt}</p>
      </div>
    </div>
    <div class="lower-message">
      <div class="message-content">
        <p>${MessagesContent}</p>
      </div>
    </div>`
                        
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_messages_content');
    messages.insertAdjacentHTML('beforeend', HTML);
    newMessage.value='';
  }
});
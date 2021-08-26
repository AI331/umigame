import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const comment = `<p>${data.content.comment}</p>`;
    const CreatedAt = `<p>${data.content.created_at}</p>`;
    const Nickname = `<p>${data.user.nickname}</p>`;
    const HTML = `
    <div class="balloon-right">
      <div class="comment-user">
        <p>${Nickname}</p>
      </div>
      <div class="comment-content">
        <p>${comment}</p>
      </div>
      <div class="comment-date">
        <p>${CreatedAt}</p>
      </div>

    </div>`
                        
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_comment');
    comments.insertAdjacentHTML('beforeend', HTML);
    newComment.value='';
  }
});

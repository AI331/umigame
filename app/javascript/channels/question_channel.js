import consumer from "./consumer"

consumer.subscriptions.create("QuestionChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const title = `<p>${data.content.title}</p>`;
    const question = `<p>${data.content.q_content}</p>`;
    const answer = `<p>${data.content.q_answer}</p>`;

    const questions = document.getElementById('question');
    const newQuestion = document.getElementById('message_text');
    const html = `
      <div class="question-content">
        <div class="q_title">
          <p>${title}</p>
        </div>
        <div class="q_question">
          <p>${question}</p>
        </div>
      </div>
      <div class="">
        <div class="q_answer">
          <p>${answer}</p>
        </div>
      </div>`
      
    questions.insertAdjacentHTML('beforeend', html);
    newQuestion.value='';
  }
});

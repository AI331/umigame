import consumer from "./consumer"

consumer.subscriptions.create("QuestionChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const title = `<h2>${data.content.title}</h2>`;
    const question = `<h2>${data.content.q_content}</h2>`;
    const answer = `<h2>${data.content.q_answer}</h2>`;
    const questions = document.getElementById('question');
    const qSelect =document.getElementById('q_select');
    const html = `
      <div class="question-content">
        <div class="q_title">
          ${title}
        </div>
        <div class="q_question">
          ${question}
        </div>
      </div>
      <div class="answer">
        <div class="q_answer">
          ${answer}
        </div>
      </div>` 
    questions.insertAdjacentHTML('beforeend', html);
    qSelect.innerHTML='';
  }
});
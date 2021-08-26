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
    const questions = document.getElementById('question');
    const qSelect =document.getElementById('q_select');
    const html = `
      <div class="question-content">
        <h2>※※※大変お手数ですが、一度画面のリロードをお願いいたします。※※※<h2>
        <div class="q_title">
          ${title}
        </div>
        <div class="q_question">
          ${question}
        </div>
      </div>` 
    questions.insertAdjacentHTML('beforeend', html);
    qSelect.innerHTML='';
  }
});
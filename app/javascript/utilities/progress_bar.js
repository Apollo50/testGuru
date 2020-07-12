document.addEventListener('turbolinks:load', function () {
    var progressBar = document.querySelector('.progress-bar');

    if (progressBar) { changeProgress(progressBar) }

    function changeProgress(progressBar) {
        var currentQuestion = progressBar.dataset.currentQuestion;
        var totalQuestions = progressBar.dataset.totalQuestions;

        var progress = (100*(currentQuestion-1)/totalQuestions) + '%';

        progressBar.style.width = progress
        progressBar.textContent = progress
    }
});
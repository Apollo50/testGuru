document.addEventListener('turbolinks:load', function () {
    var editButtons = document.querySelectorAll('.form-inline-link')

    editButtons.forEach( function(element) {
        element.addEventListener('click', formInlineLinkHandler)
    })

    var errors = document.querySelector('.resource-errors')

    if (errors) {
        var testId = errors.dataset.resourceId
        formInlineHandler(testId)
    }

    function formInlineLinkHandler(event) {
        event.preventDefault()

        var testId = this.dataset.testId
        formInlineHandler(testId)
    }

    function formInlineHandler(testId) {
        var editForm = document.querySelector(`.form-inline[data-test-id="${testId}"]`)
        var title = document.querySelector(`.test-title[data-test-id="${testId}"]`)
        var editButton = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`)

        if (editForm.classList.contains('hide')) {
            title.classList.add('hide')
            editForm.classList.remove('hide')
            editButton.textContent = 'Close'
        } else {
            title.classList.remove('hide')
            editForm.classList.add('hide')
            editButton.textContent = 'Edit'
        }
    }
});
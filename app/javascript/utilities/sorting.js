    document.addEventListener('turbolinks:load', function () {
        let control = document.querySelector('.sort-by-title')
        if (control) { control.addEventListener('click', sortRowsByTitle )}
    })

    function sortRowsByTitle() {
        let table = document.querySelector('table')
        let rows = table.querySelectorAll('tr')

        let sortedRows = []

        for (let i = 1; i < rows.length; i++) {
            sortedRows.push(rows[i])
        }

        if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
            sortedRows.sort(compareRowsAsc)

            this.querySelector('.octicon-arrow-up').classList.toggle('hide')
            this.querySelector('.octicon-arrow-down').classList.toggle('hide')
            // this.querySelector('.octicon-arrow-up').classList.remove('hide')
            // this.querySelector('.octicon-arrow-down').classList.add('hide')
        } else {
            sortedRows.sort(compareRowsDesc)
            this.querySelector('.octicon-arrow-up').classList.toggle('hide')
            this.querySelector('.octicon-arrow-down').classList.toggle('hide')
        }

        let sortedTable = document.createElement('table')

        sortedTable.classList.add('table', 'table-striped', 'table-dark', 'text-center')
        sortedTable.appendChild(rows[0])

        for (let i = 0; i < sortedRows.length; i++) {
            sortedTable.appendChild(sortedRows[i])
        }

        table.parentNode.replaceChild(sortedTable, table)
    }

    function compareRowsAsc(rows1, rows2) {

        let testTitle1 = rows1.querySelector('td').textContent
        let testTitle2 = rows2.querySelector('td').textContent

        if (testTitle1 < testTitle2) {return -1}
        if (testTitle1 > testTitle2) {return 1}
        return 0
    }

    function compareRowsDesc(rows1, rows2) {

        let testTitle1 = rows1.querySelector('td').textContent
        let testTitle2 = rows2.querySelector('td').textContent

        if (testTitle1 < testTitle2) {return 1}
        if (testTitle1 > testTitle2) {return -1}
        return 0
    }

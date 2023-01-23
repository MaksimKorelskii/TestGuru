class RowSort {
  constructor() {
    this.control = document.querySelector('.sort-by-title')

    this.setup()
  }

  setup(){
    this.control.addEventListener('click', event => { this.sortRows() })
  }

  sortRows() {
    let table = document.querySelector('table')

    let rows = table.querySelectorAll('tr')
    let sortedRows = []

    for (let i = 1; i < rows.length; i++) {
      sortedRows.push(rows[i])
    }

    if (this.control.querySelector('.octicon-arrow-up').classList.contains('hide')) {
      sortedRows.sort(this.compareRowsAsc)
      this.control.querySelector('.octicon-arrow-up').classList.remove('hide')
      this.control.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
      sortedRows.sort(this.compareRowsDesc)
      this.control.querySelector('.octicon-arrow-down').classList.remove('hide')
      this.control.querySelector('.octicon-arrow-up').classList.add('hide')
    }

    let sortedTable = document.createElement('table')

    sortedTable.classList.add('table')
    sortedTable.appendChild(rows[0])

    for (let i = 0; i < sortedRows.length; i++) {
      sortedTable.appendChild(sortedRows[i])
    }

    table.parentNode.replaceChild(sortedTable, table)
  }

  compareRowsAsc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 > testTitle2) { return 1 }
    if (testTitle1 < testTitle2) { return -1 }
    return 0 
  }

  compareRowsDesc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 > testTitle2) { return -1 }
    if (testTitle1 < testTitle2) { return 1 }
    return 0 
  }
}

document.addEventListener('turbolinks:load', function() {
    const control = document.querySelector('.sort-by-title')

    if (control) new RowSort
  })

class ProgressBar{
  constructor(progress){
    this.progress = progress
    this.positionOfCurrentQuestion = this.progress.dataset.positionOfCurrentQuestion
    this.allQuestions = this.progress.dataset.allQuestions

    this.createProgressBar()
  }

  createProgressBar() {
    let progressBar = document.createElement('progress')
    progressBar.setAttribute('max', this.allQuestions)
    progressBar.setAttribute('value', this.positionOfCurrentQuestion)
    this.progress.appendChild(progressBar)
  }
}

document.addEventListener('turbolinks:load', function() { 
  const progress = document.querySelector('.progress-bar')

  if (progress) new ProgressBar(progress)
})

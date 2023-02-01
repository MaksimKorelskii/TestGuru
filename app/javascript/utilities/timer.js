document.addEventListener('turbolinks:load', function() {
  const timer = document.querySelector('.timer')
  if (timer) {
    let time = timer.dataset.timer
    setInterval(function () {
      if (time > 0) {
        time -= 1
      } else {
        document.querySelector('form').submit()
      }
      result = parseInt(time / 60) + ':' + time % 60
      timer.innerHTML = result
    }, 1000)
  }
})

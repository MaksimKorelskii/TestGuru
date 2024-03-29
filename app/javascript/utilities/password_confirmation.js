class PasswordConfirmation {
  constructor(form) {
    this.form = form
    this.password = form.user_password
    this.password_confirmation = form.user_password_confirmation
    this.container = document.querySelector('div.container')

    this.setup()
  }

  resetParagraph() {
    let paragraph = document.querySelector('p.flash')
    if (paragraph) { this.container.parentNode.removeChild(paragraph) }
  }

  checkPasswords() {

    this.resetParagraph()

    let paragraph = document.createElement('p')

    if (this.password.value !== this.password_confirmation.value) {
      this.textNode = document.createTextNode("Passwords don't match!")
      paragraph.classList.add('flash', 'alert') 
    }
      else {
      this.textNode = document.createTextNode("Passwords match.")
      paragraph.classList.add('flash', 'notice') 
    }

    paragraph.appendChild(this.textNode)
    this.container.parentNode.insertBefore(paragraph, this.container)
  }

  setup() {
    this.form.addEventListener('keyup', event => {
      if (this.password.value != '' && this.password_confirmation.value != '') this.checkPasswords()
      else this.resetParagraph()
    })
  }
}

document.addEventListener('turbolinks:load', function() {
  const reg_form = document.getElementById('new_user')
  if (reg_form) new PasswordConfirmation(reg_form)
})

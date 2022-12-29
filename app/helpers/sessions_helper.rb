module SessionsHelper
  def flash_message(message)
    if flash[message]
      content_tag :p, flash[:alert], class: 'flash alert'
    end
  end
end

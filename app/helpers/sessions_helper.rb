module SessionsHelper
  def flash_message(message)
    if flash[message]
      content_tag :p, flash[message], class: "flash #{message.to_s}"
    end
  end
end

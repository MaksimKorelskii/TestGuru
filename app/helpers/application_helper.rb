module ApplicationHelper
  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: :blank
  end

  def current_year
    Date.current.year
  end

  def flash_message(name)
    if flash[name]
      content_tag :p, flash[name], class: "flash #{name.to_s}"
    end
  end
end

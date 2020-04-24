module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    content_tag(:a, "#{author}", href: "https://github.com/#{author}/#{repo}", target: '_blank')
  end

  def flash_message(key)
    if flash[key]
      content_tag :p, flash[key], class: 'flash message'
    end
  end
end

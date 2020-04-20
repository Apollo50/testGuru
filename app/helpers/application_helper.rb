module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    content_tag(:a, "#{author}", href: "https://github.com/#{author}/#{repo}", target: '_blank')
  end
end

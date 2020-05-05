module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to( "#{author}", "https://github.com/#{author}/#{repo}", target: '_blank' )
  end

  def flash_message(key)
    if flash[key]
      content_tag :p, flash[key], class: 'flash message'
    end
  end

  def test_header(test)
    if test.persisted?
      "Edit '#{test.title}' Question"
    else
      "Create New  Question"
    end
  end
end

module ApplicationHelper

  def data_now
    Time.now.strftime("%m/%d/%Y")
  end

  def github_url(author, repo)
    link_to author, repo, target: :_blank
  end

end

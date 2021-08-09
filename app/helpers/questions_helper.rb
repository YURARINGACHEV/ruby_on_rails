module QuestionsHelper

  def data_now
  	 Time.now.strftime("%m/%d/%Y")
  end
# нужно сделать метод, который принимает два значения в себя и возвращает link_to
# Для формирования ссылки на GitHub репозиторий: github_url(author, repo)
  def question_header(author, repo)
    link_to "author", "https://github.com/YURARINGACHEV", "repo", "https://github.com/YURARINGACHEV/ruby_on_rails"
    link_to "repo", "https://github.com/YURARINGACHEV/ruby_on_rails"
  end

end

class ImportArticlesFromJsonJob < ApplicationJob
  queue_as :default

  def perform(file_name)
    articles = get_articles_as_list(file_name)

    articles.each do |article|      
      tags_attributes = article['tags'].each_with_object([]) do |tag, array|
        if tag['name'].first != '#'
          array << { title: tag["name"] }
        end
      end

      article_object = Article.new(
        title: article['title'],
        content: article['html']
      )

      tags_attributes.each do |tag_attributes|
        article_object.tags.find_or_initialize_by(tag_attributes)
      end

      article_object.save
    end
  end

  def get_articles_as_list(file_name)
    file_path = File.join(Rails.root, 'data', 'json', file_name)
    file = File.read(file_path)
    articles = JSON.parse(file)
    articles['posts']
  end
end

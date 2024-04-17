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

      tags = tags_attributes.each_with_object([]) do |tag_attributes, array|
        array << Tag.find_or_initialize_by(title: tag_attributes[:title])
      end

      article_object.tags = tags

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

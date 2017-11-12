class SitemapController < ActionController::Base
  layout nil

  def index
    headers['Content-Type'] = 'application/xml'
    @articles = Article.published
    @tags = Article.published.tags_on(:tags)
    respond_to do |format|
      format.xml
    end
  end
end

class SitemapController < ActionController::Base
  layout nil

  def index
    headers['Content-Type'] = 'application/xml'
    respond_to do |format|
      format.xml { [@articles = Article.published] }
    end
  end
end

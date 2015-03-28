require 'google/api_client'

class GoogleAPI

  DEVELOPER_KEY = ENV["google_api_dev_key"]
  YOUTUBE_API_SERVICE_NAME = "youtube"
  YOUTUBE_API_VERSION = "v3"


  attr_accessor :client

  def initialize
    @initialized = true
    @api_key = DEVELOPER_KEY
    @client = Google::APIClient.new(:key => DEVELOPER_KEY,
                               :authorization => nil)

    @youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)
  end

  def initialized?
    @initialized || false
  end

  def query q, max_results
    search_response = @client.execute!(
      :api_method => @youtube.search.list,
      :parameters => { q: q, maxResults: max_results, :part => 'id,snippet', videoCaption: "closedCaption", type: "video", order: "relevance"}
    )
    videos = []
    # Add each result to the appropriate list, and then display the lists of
    # matching videos, channels, and playlists.
    search_response.data.items.each do |search_result|
      case search_result.id.kind
        when 'youtube#video'
          videos.push({
            title: search_result.snippet.title,
            thumbnail_url: search_result.snippet.thumbnails.default.url,
            video_id: search_result.id.videoId,
            description: search_result.snippet.description,
            url: ("http://www.youtube.com/watch?v="+search_result.id.videoId)
            })
      end
    end

    return videos

  end
  

end
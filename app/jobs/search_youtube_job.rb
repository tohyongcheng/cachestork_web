class SearchYoutubeJob
  include SuckerPunch::Job
  require 'fileutils'

  def perform(query, num_of_results)
    @google_api = GoogleAPI.new
    videos_list = @google_api.query(query, num_of_results)

    category = Category.create(title: query)
    videos_list.each do |vid|
      created_videos = Video.where(video_id: vid[:video_id])
      if created_videos.empty?
        created_video = Video.create(vid)
      else
        created_video = created_videos.first
      end
      category.videos << created_video
    end

    write_to_file(query, videos_list)
    return
  end

  def write_to_file(query, vid_hash)
    dirname = File.dirname("videos/"+query+"/")
    unless dirname == "videos/"+query+"/"
      dirname = FileUtils.mkdir_p("videos/"+query+"/")
    end

    puts dirname 

    File.open("videos/"+query+"/"+"videos.txt", 'w') do |file|
      vid_hash.each do |vid|
        file.write(vid[:url] + "\n")
      end
    end
  end
end
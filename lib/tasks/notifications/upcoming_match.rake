class MatchNotifications
  def post_upcoming_match_notification

      matches = Match.all
      matches_today = matches.select{|match| Date.today == match.date.to_date}
      matches_today.each do |match|

        match.players.each do |player|
          fb_provider = Player.find(player.id).providers.where(provider: "facebook").first
          options = {match: match, player: player}
          unless fb_provider.nil?
            p "Access token #{ENV["FACEBOOK_MF_ACCESS_TOKEN"]}"
            uri = URI.encode("https://graph.facebook.com/#{fb_url(fb_provider.uid, ENV["FACEBOOK_MF_ACCESS_TOKEN"], options)}")
            uri = URI.parse(uri)
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            fb_req = Net::HTTP::Post.new(uri.request_uri)
            fb_response = http.request(fb_req)

            p "NOTIFICATION SENT #{fb_response.body}"
          end
        end
      end

  end

  private

  def fb_url(fb_user_id, access_token, options)
    match = options.fetch :match
    player = options.fetch :player
    message = "Don't forget, you have a match against #{match.other_team(player).name} at #{match.date.to_s(:short)}"
    "#{fb_user_id}/notifications?access_token=#{access_token}&href=http://www.matchfixing.co.uk/matches/#{match.id}&template=#{message}!"
  end

end

desc "Sending a facebook notification about an upcoming match"
task fb_note_upcoming_match: :environment do
  MatchNotifications.new.post_upcoming_match_notification
end
class MatchNotifications

  def initialize
    @access_token = "#{ENV["FACEBOOK_MF_ACCESS_TOKEN_1"]}|#{ENV["FACEBOOK_MF_ACCESS_TOKEN_2"]}"
  end

  def post_match_reminder
      matches_today.each do |match|
        match.players.each do |player|
          fb_provider = Player.find(player.id).providers.where(provider: "facebook").first
          url_endpoint = "/matches/#{match.id}"
          message = "Don't forget! You have a match against #{match.other_team(player).name} on #{match.date.to_s(:short)}. Visit matchfixing.co.uk to find out more"
          unless fb_provider.nil?
            uri = URI.encode("https://graph.facebook.com/#{fb_url(fb_provider.uid, @access_token , url_endpoint, message)}")
            create_request(uri)
          end
        end
      end
  end

  def post_result
    recent_matches.each do |match|
      match.players.each do |player|
        fb_provider = Player.find(player.id).providers.where(provider: "facebook").first
        url_endpoint = "/matches/#{match.id}"
        message = "After your team's last result, your team is now #{player.team.league_position} in the league. Visit matchfixing.co.uk to rate #{match.other_team(player).name}"
        unless fb_provider.nil?
          uri = URI.encode("https://graph.facebook.com/#{fb_url(fb_provider.uid, @access_token , url_endpoint, message)}")
          create_request(uri)
        end
      end
    end
  end

  private

  def create_request(uri)
    uri = URI.parse(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    fb_req = Net::HTTP::Post.new(uri.request_uri)
    fb_response = http.request(fb_req)
    p "RESPONSE CODE: #{fb_response.code} - BODY #{fb_response.body}"
  end

  def fb_url(fb_user_id, access_token, url_endpoint, message)
    "#{fb_user_id}/notifications?access_token=#{access_token}&template=#{message}!"
  end

  def matches_today
    matches = Match.all
    matches_today = matches.select{|match| Date.today == match.date.to_date}
    matches_today.each do |match| match end
  end

  def recent_matches
    matches = Match.all
    recent_matches = matches.select{|match| Date.today == (match.date.to_date + 1) || Date.today == (match.date.to_date + 2)}
    recent_matches.each do |match| match end
  end

end

desc "Send a facebook notification about an upcoming match"
task fb_note_upcoming_match: :environment do
  MatchNotifications.new.post_match_reminder
end

desc "Send a facebook notification about a past result and a team's league position"
task fb_note_result: :environment do
  MatchNotifications.new.post_result
end
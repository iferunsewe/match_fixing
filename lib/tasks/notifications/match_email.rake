class MatchEmails

  def initialize
    @recent_matches = MatchNotifications.new.recent_matches
  end


  def send_post_match_email
    @recent_matches.each do |match|
      match.players.each do |player|
        PlayerMailer.post_match_email(player).deliver
      end
    end
  end

end

desc "Send an email about a match just played"
task post_match_email: :environment do
  MatchEmails.new.send_post_match_email
end
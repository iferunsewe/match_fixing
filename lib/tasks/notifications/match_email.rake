class MatchEmails


  def send_post_match_email

  end


end

desc "Send an email about a match just played"
task post_match_email: :environment do
  MatchEmails.new.send_post_match_email
end
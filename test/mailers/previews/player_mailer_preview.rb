# Preview all emails at http://localhost:3000/rails/mailers/player_mailer
class PlayerMailerPreview < ActionMailer::Preview
  def post_match_email_preview
    PlayerMailer.post_match_email(Player.find(1))
  end
end

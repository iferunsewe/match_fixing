class PlayerMailer < ApplicationMailer
  default from: 'info@matchfixing.co.uk'

  def post_match_email player
    @player = player
    @last_match = @player.matches.where(status: true).order(:date).last
    @last_opposition = if @last_match.team_a == @player.team
                         @last_match.team_b
                       else
                         @last_match.team_a
                       end
    @url = "http://www.matchfixing.co.uk/matches/#{@last_match.id}"
    mail(to: @user.email, subject: "How bad were they?")
  end
end
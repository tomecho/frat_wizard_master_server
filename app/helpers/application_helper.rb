module ApplicationHelper
  # returns false or profile
  def get_facebook_profile_by_token(token, fields = [])
    return false if token.nil?
    uri = URI.parse "https://graph.facebook.com/me?fields=#{fields.map(&:to_s).join(',')}&access_token=#{token}"
    fb = Net::HTTP.get_response(uri)

    if fb && fb.code == '200'
      return JSON.parse(fb.body)
    end
    false
  end
end

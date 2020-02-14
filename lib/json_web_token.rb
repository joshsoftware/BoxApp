# frozen_string_literal: true

class JsonWebToken
  SECRET_KEY = ENV["JWT_SECRET"]

  def self.encode(payload, exp=24.hours.from_now)
    payload[:exp] = exp.to_i
    begin
      JWT.encode(payload, SECRET_KEY)
    rescue JWT::EncodeError
      nil
    end
  end

  def self.decode(token)
    begin
      decoded = JWT.decode(token, SECRET_KEY)[0]
    rescue JWT::DecodeErro
      nil
    end
    HashWithIndifferentAccess.new decoded
  end
end

# app/services/jwt_service.rb
class JwtService
    def self.decode(token)
      JWT.decode(token, Rails.application.secrets.secret_key_base).first
    rescue JWT::DecodeError, JWT::VerificationError
      nil
    end
  end
  
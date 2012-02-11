require 'openssl'
###############
# Remove this code after setting up SSL
if Rails.env.development?
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end
###############

if Rails.env.development?
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '238717112880723', '6eb791ac195a3088e2b993a3071fca4c'
  end
else
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '252390728169754', 'f76612afb0854607ccfece69a3f1eaf8'
  end
end


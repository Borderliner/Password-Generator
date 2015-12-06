require 'digest/sha1'

module Crypt
  def sha1_hex(value)
    return Digest::SHA1.hexdigest(value)
  end

  def sha1_base64(value)
    return Digest::SHA1.base64digest(value)
  end
end

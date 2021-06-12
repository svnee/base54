require "base45/version"

module Base45
  class Error < StandardError; end
  
  CHARSET = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ $%*+-./:'

  def self.encode(input)
    raise Error unless input.is_a? String 
    bytes = input.bytes
    result = ''
    (0..bytes.length-1).step(2).each do |i|
      if bytes.length - i > 1
        x = (bytes[i] << 8) + bytes[i + 1]
        e, x = x.divmod 45 * 45
        d, c = x.divmod 45
        result += CHARSET[c] + CHARSET[d] + CHARSET[e]
      else
        x = bytes[i]
        d, c = x.divmod 45
        result += CHARSET[c] + CHARSET[d]
      end
    end
    result
  end

  def self.decode(input)
    raise Error unless input.is_a? String
    return [] if input.length.zero?

    begin
      result = []
      buf = input.chars.map { |c| CHARSET.index(c) }
      (0..buf.length).step(3).each do |i|
        x = buf[i].to_i + buf[i + 1].to_i * 45
        if buf.length - i >= 3
          x = buf[i] + buf[i + 1] * 45 + buf[i + 2] * 45 * 45
          x.divmod(256).each { |e| result << e }
        else
          result << x
        end
      end
      result
    rescue
      raise Error
    end
  end
end
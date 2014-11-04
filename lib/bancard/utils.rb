module Bancard::Utils
  def stringify_keys(hash)
    hash.each_with_object(hash.dup.clear) do |(k, v), new_hash|
      new_hash[k.to_s] = v
    end
  end
end

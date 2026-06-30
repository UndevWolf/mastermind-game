module Compare
  def compare(guess, code)
    c = code.dup
    g = guess.dup
    result = [0, 0]
    c.each_with_index do |_, i|
      next unless c[i] == g[i]

      c[i] = nil
      g[i] = nil
    end

    c.compact!
    g.compact!
    g.each do |n|
      next unless c.include?(n)

      result[1] += 1
      c[c.index(n)] = nil
      g[g.index(n)] = nil
    end
    result[0] = 4 - c.length
    result
  end
end

module Compare
  def compare(guess, code)
    c = code.dup
    g = guess.dup
    result = [0, 0]
    c.each_with_index do |_, i|
      if c[i] == g[i]
        c[i] = nil
        g[i] = nil
      end
    end
    c.compact.each { |n| result[1] += 1 if g.compact.include?(n) }
    result[0] = 4 - c.compact.length
    result
  end
end

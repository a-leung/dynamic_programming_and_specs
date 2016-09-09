class Fibonnaci
  def initialize
    @cache = {}
  end

  def num(at)
    return @cache[at] if @cache[at]

    return 0 if at == 0
    return 1 if at == 1
    return 1 if at == 2

    @cache[at] = num(at-1) + num(at-2)
  end
end

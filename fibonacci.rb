class Fibonacci
  def initialize
    @cache = {}
  end

  def num(at)
    return 0 if at == 0
    return 1 if at == 1
    return 1 if at == 2

    num(at-1) + num(at-2)
  end

  def num_dyn(at)
    return @cache[at] if @cache[at]

    return 0 if at == 0
    return 1 if at == 1
    return 1 if at == 2

    @cache[at] = num(at-1) + num(at-2)
  end
end

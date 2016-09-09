class Fibonnaci
  def num(at)
    return 0 if at == 0
    return 1 if at == 1
    return 1 if at == 2

    num(at-1) + num(at-2)
  end
end

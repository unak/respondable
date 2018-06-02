class Respondable
  VERSION = "0.0.1"

  def initialize(obj)
    @obj = obj
  end

  def _?(sym)
    @obj.respond_to?(sym)
  end
end

module Kernel
  def Respondable(obj)
    Respondable.new(obj)
  end
end

class Symbol
  def ===(other)
    if other.is_a?(Respondable)
      other._?(self)
    else
      self == other
    end
  end
end

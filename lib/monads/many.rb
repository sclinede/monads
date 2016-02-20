require 'monads/monad'

module Monads
  Many = Struct.new(:values) do
    include Monad

    def and_then(&block)
      block = ensure_monadic_result(&block)

      Many.new(values.map(&block).flat_map(&:values))
    end

    def self.from_value(value)
      Many.new(Array(value))
    end
  end
end

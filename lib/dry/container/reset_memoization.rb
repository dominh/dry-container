module Dry
  class Container
    module ResetContainerMemoization

      # Useful for testing
      def reset_memoization!
        _container.values.each(&:reset_memoization!)
      end

      # reset memoization have already been enabled turning this into a noop
      def enable_reset_memoization!
        # DO NOTHING
      end
    end

    module ResetItemMemoization
      def reset_memoization!
        return unless self.is_a? Item::Memoizable

        memoize_mutex.synchronize do
          @memoized_item = nil
        end
      end
    end

    module Mixin
      def enable_reset_memoization!
        extend ::Dry::Container::ResetContainerMemoization
        Item.include ResetItemMemoization
      end
    end
  end
end

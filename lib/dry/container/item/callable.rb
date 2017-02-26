module Dry
  class Container
    class Item
      # Callable class to returns a item call
      #
      # @api public
      #
      class Callable < Base
        # Returns the result of item call or item
        #
        # @return [Mixed]
        def call
          callable? ? item.call : item
        end

        private

        # @private
        def callable?
          options[:call]
        end
      end
    end
  end
end

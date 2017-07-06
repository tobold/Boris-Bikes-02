
require_relative 'bike'


class DockingStation

    attr_reader :capacity

    DEFAULT_CAPACITY = 20

    def initialize(capacity = DEFAULT_CAPACITY)
      @capacity = capacity
      @bikes = []
    end

    def release_bike
      fail 'No bikes available' if empty?
      fail 'No working bikes available' if working_bike_array.empty?
      @bikes.delete(working_bike_array.pop)
    end

    def dock(bike)

      fail 'There is no space to dock' if full?
      @bikes << bike
      #puts "#{bike} has been docked."
    end

    private

      attr_reader :bikes

      def working_bike_array
        #filter out broken bikes and return array
        @bikes.reject{|bike| bike.working == false}
      end

      def full?
        return true if @bikes.count >= @capacity #refactor
      end


      def empty?
        return true if @bikes.count == 0
      end

end

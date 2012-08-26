# -*- coding: UTF-8 -*-

module RubyPersistenceAPI

  module Abstract

    class Backend

      def [](entity_object_or_entity_class)
        begin
          if entity_object_or_entity_class.is_a?(Class)
            query(entity_object_or_entity_class)
          else
            gateway(entity_object_or_entity_class)
          end
        rescue Exception => e
          raise e
        end
      end

      private

      def query(entity_class)
        begin
          gateway_class = deduce_gateway_class_from(entity_class)
          gateway = gateway_class.new(self)
          Query.new(gateway)
        rescue Exception => e
          raise e
        end
      end

      def gateway(entity)
        begin
          gateway_class = deduce_gateway_class_from(entity.class)
          gateway_class.new(self, entity)
        rescue Exception => e
          raise e
        end
      end

      def deduce_gateway_from(entity_class)
        gateway_class = deduce_gateway_class_from(entity_class)
        gateway_class.new(self)
      end

      def deduce_gateway_class_from(entity_class)
        gateway_class_name = "#{entity_class.name.demodulize}Gateway"

        backend_module = self.class.name.split("::")[0...-1].join("::").constantize

        known_gateways = backend_module::Gateway.subclasses

        gateway_class = known_gateways.find { |klass| klass.name.demodulize == gateway_class_name }

        if gateway_class.nil?
          raise StandardError.new("Cannot find #{gateway_class_name} among known gateways: #{known_gateways.map(&:name)}")
        end

        gateway_class
      end

    end

  end

end

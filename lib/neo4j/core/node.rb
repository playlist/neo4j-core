require 'neo4j/core/wrappable'

module Neo4j
  module Core
    class Node
      attr_reader :id, :labels, :properties
      alias props properties

      include Wrappable

      # Perhaps we should deprecate this?
      alias neo_id id

      def initialize(id, labels, properties = {})
        @id = id
        @labels = labels.map(&:to_sym) unless labels.nil?
        @properties = properties
      end

      class << self
        def from_url(url, properties = {})
          id = url.split('/')[-1].to_i
          labels = nil # unknown
          properties = properties

          new(id, labels, properties)
        end
      end
    end
  end
end

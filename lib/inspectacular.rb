# frozen_string_literal: true

require_relative "inspectacular/version"

# Extend any object to get a custom #inspect method with the given attributes. If no attributes are
# given, the default is to inspect the object's #id attribute.
#
# Example:
#
#   class User < ApplicationRecord
#     extend Inspector[:id, :name, :email]
#   end
#
#   User.first.inspect
#   #=> "#<User id: 1, name: 'John Doe', email: 'john@doe.com'>
module Inspectacular
  def self.extended(base) # :nodoc:
    base.class_eval do
      class_attribute :inspected_attrs, instance_predicate: false, default: [:id]

      def inspect
        str = "#<#{self.class.name} "
        attrs = self.class.inspected_attrs.map { |attr| "#{attr}: #{send(attr).inspect}" }
        str << attrs.join(', ') << '>'
      end
    end
    base.inspected_attrs = @inspected_attrs if @inspected_attrs
  end

  def self.[](*attrs)
    @inspected_attrs = attrs
    self
  end
end

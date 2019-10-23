# frozen_string_literal: true

# Copyright 2019 OpenTelemetry Authors
#
# SPDX-License-Identifier: Apache-2.0

module OpenTelemetry
  module Trace
    # No-op implementation of a tracer factory.
    class TracerFactory
      HTTP_TEXT_FORMAT = DistributedContext::Propagation::HTTPTextFormat.new
      BINARY_FORMAT = DistributedContext::Propagation::BinaryFormat.new
      private_constant(:HTTP_TEXT_FORMAT, :BINARY_FORMAT)

      # Returns a {Tracer} instance.
      #
      # @param [optional String] name Instrumentation package name
      # @param [optional String] version Instrumentation package version
      #
      # @return [Tracer]
      def tracer(name = nil, version = nil)
        @tracer ||= Tracer.new
      end

      def binary_format
        BINARY_FORMAT
      end

      def http_text_format
        HTTP_TEXT_FORMAT
      end
    end
  end
end

# author: Vincent Landgraf <setcool@gmx.de>
# licence: GPLv2.1
require "rubygems"
require "coderay"

module CodeRay
  module Scanners
    class Term < Scanner
      include CodeRay::Streamable
      register_for :term

      def scan_tokens (tokens, options)
        state = :initial

        until eos?
          if state == :initial
            if match = scan(/^\$/)
              tokens << [match, :prompt]
            else
              command = scan(/.*?\n/)
              tokens << [command, :command]
              state = :output unless command =~ /\\$/
            end
          else
            tokens << [scan(/.*?\n/), :output]
          end
        end

        return tokens
      end
    end
  end
end
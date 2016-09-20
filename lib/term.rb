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
        prev = nil

        until eos?
          line = scan(/.*?\n/)
          if line =~ /^(\$)(.*)/
            tokens << [$1, :prompt]
            tokens << [$2 + "\n", :command]
          elsif prev =~ /\\$/
            tokens << [line, :command]
          else
            tokens << [line, :output]
          end
          prev = line
        end

        return tokens
      end
    end
  end
end
#!/usr/bin/ruby
# Project Euler #6
# What is the 10 001st prime number?
# Answer: 104743

require 'prime'
puts(Prime.take(10001).last)

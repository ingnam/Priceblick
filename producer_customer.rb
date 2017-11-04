# Question number 1

require 'thread'
require 'logger'

queue = SizedQueue.new(2)
logger = Logger.new(STDOUT)

Thread.new do
  number = 0
  loop do
    number += 1
    queue << number
    logger.info "Produced item: #{number}"
  end
end

consumers = 2.times.map do |i|
  Thread.new do
    loop do
      number = queue.pop
      logger.info "Consumed item: #{number}"
      sleep number
    end
  end
end

consumers.each(&:join)
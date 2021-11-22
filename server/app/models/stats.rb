# frozen_string_literal: true

class Stats
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def dash!
    incr(:dashes)
  end

  def dashes
    get(:dashes).to_i
  end

  def dashes=(value)
    set(:dashes, value)
  end

  def clear!
    del(:dashes)
  end

  def inspect
    "#<Stats::#{user.id} dashes=#{dashes}>"
  end

  private

  def prefix(key) = "#{user.id}/#{key}"

  def get(key) = Redis.current.get(prefix(key))
  def set(key, value) = Redis.current.set(prefix(key), value)
  def del(key) = Redis.current.del(prefix(key))
  def incr(key) = Redis.current.incr(prefix(key))

  def len(key) = Redis.current.llen(prefix(key))
  def range(key) = Redis.current.lrange(prefix(key), 0, -1)
  def push(key, value) = Redis.current.rpush(prefix(key), value)
  def pop(key) = Redis.current.lpop(prefix(key))
end
